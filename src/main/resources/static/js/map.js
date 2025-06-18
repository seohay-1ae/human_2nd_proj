window.onload = function () {
    kakao.maps.load(function () {
        const container = document.getElementById('map');
        const options = {
            center: new kakao.maps.LatLng(36.5184, 126.8000),
            level: 10
        };
        const map = new kakao.maps.Map(container, options);

        const detailBox = document.getElementById('place-detail');

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

                    // ✅ 마커 옆에 항상 표시되는 CustomOverlay (말풍선 대신)
                    const overlayContent = document.createElement('div');
                    overlayContent.innerHTML = `
                        <div style="
                            background:#fff;
                            padding:4px 8px;
                            border:1px solid #555;
                            border-radius:4px;
                            font-size:12px;
                            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
                            white-space: nowrap;
                        ">
                            ${loc.title}
                        </div>
                    `;

                    const customOverlay = new kakao.maps.CustomOverlay({
                        content: overlayContent,
                        position: markerPosition,
                        yAnchor: 1.5
                    });
                    customOverlay.setMap(map);

                    // ✅ 마커 클릭 시 요약 카드 표시
                    kakao.maps.event.addListener(marker, 'click', function () {
                        fetch('/api/session/set-content-id', {
                            method: 'POST',
                            headers: {'Content-Type': 'application/json'},
                            body: JSON.stringify({contentId: loc.contentId})
                        });

                        detailBox.innerHTML = `
                            <div class="summary-card" onclick="openDetailModal(${loc.contentId})">
                                <h3>${loc.title}</h3>
                                <p><strong>주소:</strong> ${loc.addr1 || '정보 없음'}</p>
                            </div>
                        `;
                        detailBox.style.display = 'block';
                    });
                });
            });

        // 현재 탭 상태 저장
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
