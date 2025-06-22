function initPlaceModal(contentId) {
    // 탭 전환 이벤트 등록
    document.querySelectorAll('.tab-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
            document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
            btn.classList.add('active');
            document.getElementById('tab-' + btn.dataset.tab).classList.add('active');
        });
    });

    // 리뷰 폼 이벤트 등록
    const reviewForm = document.getElementById('reviewForm');
    if (reviewForm) {
        reviewForm.addEventListener('submit', function (e) {
            e.preventDefault();
            const content = this.content.value.trim();
            if (!content) return alert("내용을 입력하세요.");

            fetch('/review/save', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({placeId: contentId, content})
            }).then(res => {
                if (res.ok) {
                    alert("리뷰가 등록되었습니다.");
                    this.reset();
                    loadReviews(contentId);
                } else {
                    alert("리뷰 등록에 실패했습니다.");
                }
            });
        });
    }

    // 초기 리뷰 불러오기
    loadReviews(contentId);

    // 지도 표시용 정보 요청 (위경도 필요)
    fetch(`/place/location?contentid=${contentId}`)
        .then(res => res.json())
        .then(data => {
            // autoload=false 이므로 kakao.maps.load() 필요
            if (window.kakao && window.kakao.maps && kakao.maps.load) {
                kakao.maps.load(function () {
                    const mapContainer = document.querySelector('.content-map');
                    if (!mapContainer) return;

                    const mapOption = {
                        center: new kakao.maps.LatLng(data.mapy, data.mapx),
                        level: 3
                    };

                    const map = new kakao.maps.Map(mapContainer, mapOption);

                    const marker = new kakao.maps.Marker({
                        position: mapOption.center,
                        map: map
                    });
                });
            } else {
                console.error("Kakao Maps 객체가 로드되지 않았습니다.");
            }
        })
        .catch(err => console.error("지도 정보 불러오기 실패", err));
}

function loadReviews(contentId) {
    fetch(`/review/list?placeId=${contentId}`)
        .then(res => res.json())
        .then(reviews => {
            const listDiv = document.getElementById('reviewList');
            if (!reviews.length) {
                listDiv.innerHTML = '<p>등록된 리뷰가 없습니다.</p>';
                return;
            }
            listDiv.innerHTML = reviews.map(r => `
                <div class="review-item">
                    <strong>${r.writer}</strong><br>
                    <span>${r.content}</span>
                </div>
            `).join('');
        })
        .catch(() => {
            document.getElementById('reviewList').innerHTML = '<p>리뷰를 불러오는데 실패했습니다.</p>';
        });
}