document.addEventListener('click', function (e) {
    const placeItem = e.target.closest('.place-item');
    if (placeItem) {
        const placeId = placeItem.dataset.id;
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

                // 외부 placeDetail.js 내 initPlaceModal 실행
                const script = document.createElement('script');
                script.src = '/js/placeDetail.js';
                script.onload = () => {
                    initPlaceModal(placeId);
                };
                document.body.appendChild(script);
            });
    }

    if (e.target.id === 'modalClose') {
        document.getElementById('placeModal').style.display = 'none';
        document.getElementById('placeDetailContainer').innerHTML = '';
    }
});
