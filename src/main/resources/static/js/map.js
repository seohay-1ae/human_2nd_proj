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
                    const marker = new kakao.maps.Marker({
                        map: map,
                        position: new kakao.maps.LatLng(loc.mapy, loc.mapx),
                        title: loc.title
                    });

                    const infowindow = new kakao.maps.InfoWindow({
                        content: `<div style="padding:5px;">${loc.title}<br/>${loc.addr1}</div>`
                    });

                    kakao.maps.event.addListener(marker, 'mouseover', function () {
                        infowindow.open(map, marker);
                    });
                    kakao.maps.event.addListener(marker, 'mouseout', function () {
                        infowindow.close();
                    });

                    // ✅ 마커 클릭 시 상세 정보 영역에 표시
                    kakao.maps.event.addListener(marker, 'click', function () {
                        // 세션 저장 (필요 시)
                        fetch('/api/session/set-content-id', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({ contentId: loc.contentId })
                        });

                        // 상세 정보 표시
                        detailBox.innerHTML = `
                            <h3>${loc.title}</h3>
                            <p><strong>주소:</strong> ${loc.addr1 || '정보 없음'}</p>
                            <p><strong>전화번호:</strong> ${loc.tel || '정보 없음'}</p>
                            <p><strong>설명:</strong> ${loc.overview || '설명 없음'}</p>
                            <!-- 필요 시 이미지도 추가 -->
                            ${loc.firstImage ? `<img src="${loc.firstImage}" alt="${loc.title}" style="max-width:100%; height:auto;">` : ''}
                        `;
                        detailBox.style.display = 'block';
                        detailBox.scrollIntoView({ behavior: 'smooth' });
                    });
                });
            });
    });
};
