window.onload = function () {
    kakao.maps.load(function () {
        const detailBox = document.getElementById('place-detail');
        let map, markers = [], labelDivs = [];

        // 1. 지도 초기화 함수
        function initializeMap(centerLatLng) {
            const container = document.getElementById('map');
            const options = {
                center: centerLatLng,
                level: 6
            };
            map = new kakao.maps.Map(container, options);

            const userMarker = new kakao.maps.Marker({
                position: centerLatLng,
                map: map,
                title: "내 위치",
                image: new kakao.maps.MarkerImage(
                    'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
                    new kakao.maps.Size(24, 35)
                )
            });

            loadMarkers();

            kakao.maps.event.addListener(map, 'click', function () {
                detailBox.style.display = 'none';
                detailBox.dataset.currentId = '';
            });
        }

        const defaultCenter = new kakao.maps.LatLng(36.5184, 126.8000);
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (pos) {
                const userLatLng = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
                initializeMap(userLatLng);
            }, function () {
                console.warn('위치 사용 불가. 기본 위치로 지도 표시');
                initializeMap(defaultCenter);
            }, {
                enableHighAccuracy: true,
                timeout: 10000,
                maximumAge: 0
            });
        } else {
            console.warn('GPS 미지원 브라우저. 기본 위치로 지도 표시');
            initializeMap(defaultCenter);
        }

        document.getElementById('gps-button').addEventListener('click', function () {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (pos) {
                    const userLatLng = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
                    map.setCenter(userLatLng);
                }, function () {
                    alert("위치 정보를 사용할 수 없습니다.");
                }, {
                    enableHighAccuracy: true,
                    timeout: 10000,
                    maximumAge: 0
                });
            } else {
                alert("이 브라우저에서는 GPS를 지원하지 않습니다.");
            }
        });

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

        function showSummaryCard(loc) {
            const now = new Date();
            const currentDay = ['일', '월', '화', '수', '목', '금', '토'][now.getDay()];
            const currentTime = now.getHours() * 100 + now.getMinutes();

            const isRestDay = loc.restdate && loc.restdate.includes(currentDay);

            let isOpenTime = true;
            if (loc.usetime) {
                const timeMatch = loc.usetime.match(/(\d{1,2}):(\d{2})\s*~\s*(\d{1,2}):(\d{2})/);
                if (timeMatch) {
                    const open = parseInt(timeMatch[1]) * 100 + parseInt(timeMatch[2]);
                    const close = parseInt(timeMatch[3]) * 100 + parseInt(timeMatch[4]);
                    isOpenTime = (currentTime >= open && currentTime <= close);
                }
            }

            const status = (!isRestDay && isOpenTime) ? "영업중" : "영업종료";

            if (detailBox.dataset.currentId === String(loc.contentid)) return;

            detailBox.innerHTML = `
                <div class="summary-card place-item" data-id="${loc.contentid}">
                    <h3><span>${loc.title}</span></h3>
                    <p>${loc.addr1 || '정보 없음'}</p>
                    <span style="color: ${status === '영업중' ? '#1E4CD1' : 'red'};">${status}</span>
                    <p>휴무: ${loc.restdate || ''}</p>
                    <p>영업시간: ${loc.usetime || ''}</p>
                    <p>contentid: ${loc.contentid || ''}</p>
                    <img src="${loc.firstimage}" alt="${loc.title}" style="width: 100%; max-width: 390px; margin: 5px auto 0 auto; max-height: 150px; object-fit: cover;" />
                </div>
            `;
            detailBox.style.display = 'block';
            detailBox.dataset.currentId = String(loc.contentid); // 현재 ID 저장
        }

        function adjustMarkerAndLabelSize(level) {
            console.log("level:", level);
            const maxFontSize = 16, minFontSize = 7, maxLevel = 14;
            const fontSize = Math.round(maxFontSize - (level - 1) * ((maxFontSize - minFontSize) / (maxLevel - 1)));
            labelDivs.forEach(label => {
                label.style.fontSize = fontSize + 'px';
                label.style.padding = (fontSize / 2) + 'px ' + fontSize + 'px';
            });
        }

        window.currentTab = 'info';

        document.addEventListener('click', function (e) {
            const placeItem = e.target.closest('.place-item');
            if (placeItem) {
                const placeId = placeItem.dataset.id;
                console.log("placeId :" + placeId);

                if (!placeId || isNaN(placeId)) {
                    alert("잘못된 장소 ID입니다.");
                    return;
                }

                fetch(`/place/detail?contentid=${placeId}`)
                    .then(res => res.text())
                    .then(html => {
                        const container = document.getElementById('placeDetailContainer');
                        container.innerHTML = html;
                        document.getElementById('placeModal').style.display = 'block';

                        // 필요한 JS 초기화가 있다면 여기서 호출
                        const script = document.createElement('script');
                        script.src = '/js/placeDetail.js';
                        script.onload = () => {
                            if (typeof initPlaceModal === "function") {
                                initPlaceModal(placeId);
                            }
                        };
                        document.body.appendChild(script);
                    });
            }

            // 모달 닫기 버튼
            if (e.target.id === 'modalClose') {
                document.getElementById('placeModal').style.display = 'none';
                document.getElementById('placeDetailContainer').innerHTML = '';
            }
        });
    });
};
