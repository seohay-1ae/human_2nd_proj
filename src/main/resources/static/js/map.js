window.onload = function () {
    kakao.maps.load(function () {
        const detailBox = document.getElementById('place-detail');
        let map, markers = [], labelDivs = [];

        // ✅ 1. 지도 초기화 함수
        function initializeMap(centerLatLng) {
            const container = document.getElementById('map');
            const options = {
                center: centerLatLng,
                level: 6
            };
            map = new kakao.maps.Map(container, options);

            // 내 위치 마커
            const userMarker = new kakao.maps.Marker({
                position: centerLatLng,
                map: map,
                title: "내 위치",
                image: new kakao.maps.MarkerImage(
                    'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
                    new kakao.maps.Size(24, 35)
                )
            });

            loadMarkers(); // 마커 불러오기
        }

        // ✅ 2. GPS로 위치 설정 또는 기본값
        const defaultCenter = new kakao.maps.LatLng(36.5184, 126.8000);
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (pos) {
                const userLatLng = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
                initializeMap(userLatLng);
            }, function () {
                console.warn('위치 사용 불가. 기본 위치로 지도 표시');
                initializeMap(defaultCenter);
            }, {
                enableHighAccuracy: true,  // 고정밀 GPS 사용 요청
                timeout: 10000,            // 10초 내에 위치 못 받으면 에러 처리
                maximumAge: 0              // 캐시 위치 사용 안 함
            });
        } else {
            console.warn('GPS 미지원 브라우저. 기본 위치로 지도 표시');
            initializeMap(defaultCenter);
        }

        // ✅ 3. gps 버튼 눌러 내 위치로 지도의 중심을 이동
        document.getElementById('gps-button').addEventListener('click', function () {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (pos) {
                    const userLatLng = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);

                    map.setCenter(userLatLng);  // 내 위치로 지도 중심 이동만
                    // map.panTo(userLatLng); // 지도 중심을 부드럽게 이동

                }, function () {
                    alert("위치 정보를 사용할 수 없습니다.");
                }, {
                    enableHighAccuracy: true,  // 고정밀 GPS 사용 요청
                    timeout: 10000,            // 10초 내에 위치 못 받으면 에러 처리
                    maximumAge: 0              // 캐시 위치 사용 안 함
                });
            } else {
                alert("이 브라우저에서는 GPS를 지원하지 않습니다.");
            }
        });

        // ✅ 4. 마커와 오버레이 표시 함수
        function loadMarkers() {
            fetch('/api/locations')
                .then(res => res.json())
                .then(locations => {
                    locations.forEach(loc => {
                        const markerPosition = new kakao.maps.LatLng(loc.mapy, loc.mapx);

                        const marker = new kakao.maps.Marker({
                            map: map,
                            position: markerPosition,
                            title: loc.title
                        });

                        const labelDiv = document.createElement('div');
                        labelDiv.className = 'custom-overlay-label';
                        labelDiv.textContent = loc.title;
                        labelDiv.addEventListener('click', () => showSummaryCard(loc));

                        const customOverlay = new kakao.maps.CustomOverlay({
                            content: labelDiv,
                            position: markerPosition,
                            yAnchor: 1.5,
                            clickable: true
                        });
                        customOverlay.setMap(map);

                        kakao.maps.event.addListener(marker, 'click', () => showSummaryCard(loc));

                        markers.push(marker);
                        labelDivs.push(labelDiv);
                    });

                    adjustMarkerAndLabelSize(map.getLevel());

                    kakao.maps.event.addListener(map, 'zoom_changed', function () {
                        const level = map.getLevel();
                        adjustMarkerAndLabelSize(level);
                    });
                });
        }

        // ✅ 5. 요약 카드 표시
        function showSummaryCard(loc) {
            const now = new Date();
            const currentDay = ['일', '월', '화', '수', '목', '금', '토'][now.getDay()];
            const currentTime = now.getHours() * 100 + now.getMinutes(); // 예: 14시 30분 → 1430

            // 쉬는 날 확인
            const isRestDay = loc.restdate && loc.restdate.includes(currentDay);

            // 영업 시간 확인
            let isOpenTime = true;
            if (loc.usetime) {
                // 예: "09:00~18:00" 또는 "09:00 ~ 21:00"
                const timeMatch = loc.usetime.match(/(\d{1,2}):(\d{2})\s*~\s*(\d{1,2}):(\d{2})/);
                if (timeMatch) {
                    const open = parseInt(timeMatch[1]) * 100 + parseInt(timeMatch[2]);
                    const close = parseInt(timeMatch[3]) * 100 + parseInt(timeMatch[4]);
                    isOpenTime = (currentTime >= open && currentTime <= close);
                }
            }

            const status = (!isRestDay && isOpenTime) ? "영업중" : "영업종료";

            // 이미 같은 카드가 떠 있다면 다시 렌더링 안 함
            if (detailBox.dataset.currentId === String(loc.contentId)) return;

            detailBox.innerHTML = `
                <div class="summary-card" onclick="openDetailModal(${loc.contentId})">
                    <h3><span>${loc.title}</span></h3>
                    <p> ${loc.addr1 || '정보 없음'}</p>
                    <span style="color: ${status === '영업중' ? '#1E4CD1' : 'red'};">${status}</span>
                    <p>휴무: ${loc.restdate || ''} </p>
                    <p>영업시간: ${loc.usetime || ''} </p>
                    
                        <img src="${loc.firstimage}" alt="${loc.title}" style=" width: 100%;
                            max-width: 390px; margin: 5px auto 0 auto; max-height: 150px; object-fit: cover;" />
                </div>
            `;
            detailBox.style.display = 'block';
        }

        // ✅ 6. 줌 레벨에 따라 라벨 크기 조절
        function adjustMarkerAndLabelSize(level) {
            console.log("level:", level)
            const maxFontSize = 16, minFontSize = 7, maxLevel = 14;
            const fontSize = Math.round(maxFontSize - (level - 1) * ((maxFontSize - minFontSize) / (maxLevel - 1)));
            labelDivs.forEach(label => {
                label.style.fontSize = fontSize + 'px';
                label.style.padding = (fontSize / 2) + 'px ' + fontSize + 'px';
            });
        }

        // ✅ 7. 모달 및 탭 관련 전역 함수
        window.currentTab = 'info';

        window.openDetailModal = function (contentId) {
            document.getElementById('detail-modal').style.display = 'block';
            renderTab(contentId, window.currentTab);
        }

        window.closeModal = function () {
            document.getElementById('detail-modal').style.display = 'none';
            window.currentTab = 'info';
        }

        window.renderTab = function (contentId, tab) {
            window.currentTab = tab;
            const contentDiv = document.getElementById('modal-content');
            const tabBar = document.getElementById('modal-tabs');

            tabBar.innerHTML = `
                <button onclick="renderTab(${contentId}, 'info')" class="${tab === 'info' ? 'active-tab' : ''}">정보</button>
                <button onclick="renderTab(${contentId}, 'reviews')" class="${tab === 'reviews' ? 'active-tab' : ''}">리뷰</button>
                <button onclick="renderTab(${contentId}, 'photos')" class="${tab === 'photos' ? 'active-tab' : ''}">사진</button>
            `;

            if (tab === 'info') {
                fetch(`/api/places/${contentId}`)
                    .then(res => res.json())
                    .then(data => {
                        contentDiv.innerHTML = `
                            <h2>${data.title}</h2>
                            <p><strong>주소:</strong> ${data.addr1}</p>
                            <p><strong>전화:</strong> ${data.tel || '없음'}</p>
                        `;
                    });
            } else if (tab === 'reviews') {
                fetch(`/api/reviews/${contentId}`)
                    .then(res => res.json())
                    .then(reviews => {
                        contentDiv.innerHTML = `
                            <h3>리뷰 목록</h3>
                            <ul>
                                ${reviews.map(r => `<li><strong>${r.userName}</strong>: ${r.content}</li>`).join('')}
                            </ul>
                            <button onclick="renderTab(${contentId}, 'write')">리뷰쓰기</button>
                        `;
                    });
            } else if (tab === 'write') {
                contentDiv.innerHTML = `
                    <h3>리뷰 작성</h3>
                    <textarea id="review-content" rows="5" style="width:100%;"></textarea>
                    <br/>
                    <button onclick="submitReview(${contentId})">제출</button>
                    <button onclick="renderTab(${contentId}, 'reviews')">뒤로</button>
                `;
            } else if (tab === 'photos') {
                contentDiv.innerHTML = `<p>사진 탭은 준비 중입니다.</p>`;
            }
        }

        window.submitReview = function (contentId) {
            const content = document.getElementById('review-content').value;
            if (!content) {
                alert("리뷰 내용을 입력해주세요.");
                return;
            }

            fetch('/api/review', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({contentId, content})
            })
                .then(res => res.json())
                .then(() => {
                    alert('리뷰가 등록되었습니다.');
                    renderTab(contentId, 'reviews');
                });
        }
    });
};
