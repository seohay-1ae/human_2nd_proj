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

            // POST 요청할 때 body 형태를 ReviewDTO에 맞춰서 보냄
            const reviewData = {
                contentId: contentId,
                reviewContent: content
                // userId는 보통 백엔드에서 세션으로 처리하므로 클라이언트에서 안 넘김
            };

            fetch('/api/reviews', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(reviewData)
            }).then(res => {
                if (res.ok) {
                    alert("리뷰가 등록되었습니다.");
                    this.reset();
                    loadReviews(contentId);
                } else if (res.status === 401) { // 인증 실패
                    alert("로그인을 해주세요.");
                    window.location.href = '/loginSelect';
                } else {
                    alert("리뷰 등록에 실패했습니다.");
                }
            }).catch(() => alert("서버 오류로 리뷰 등록에 실패했습니다."));
        });
    }

    // 초기 리뷰 불러오기
    loadReviews(contentId);

    // 지도 표시용 정보 요청 (위경도 필요)
    fetch(`/place/location?contentid=${contentId}`)
        .then(res => res.json())
        .then(data => {
            if (window.kakao && window.kakao.maps && kakao.maps.load) {
                kakao.maps.load(function () {
                    const mapContainer = document.querySelector('.content-map');
                    if (!mapContainer) return;

                    // kakao.maps.LatLng(x, y) 순서 주의: 보통 위도(lat), 경도(lng) 순
                    // data가 mapx, mapy면 확인 필요 (보통 mapx=경도, mapy=위도)
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
    fetch(`/api/reviews?contentId=${contentId}`)
        .then(res => res.json())
        .then(reviews => {
            const listDiv = document.getElementById('reviewList');
            if (!reviews.length) {
                listDiv.innerHTML = '<p>등록된 리뷰가 없습니다.</p>';
                return;
            }
            listDiv.innerHTML = reviews.map(r => `
                <div class="review-item" data-review-id="${r.reviewId}">
                    <span>${r.userName}</span> <small>${new Date(r.createdTime).toLocaleString()}</small>
                    <button class="delete-btn" onclick="deleteReview(${r.reviewId}, ${contentId})" style="margin-left:10px !important; color:white !important; background-color:#FF4D69 !important; padding:3px 5px !important; float:right !important;">삭제</button>
                    <br/>
                    <strong>${r.reviewContent}</strong>
                </div>
            `).join('');
        })
        .catch(() => {
            document.getElementById('reviewList').innerHTML = '<p>리뷰를 불러오는데 실패했습니다.</p>';
        });
}

function deleteReview(reviewId, contentId) {
    if (!confirm('리뷰를 삭제하시겠습니까?')) return;

    fetch(`/api/reviews/${reviewId}`, {
        method: 'DELETE'
    }).then(res => {
        if (res.ok) {
            alert('리뷰가 삭제되었습니다.');
            loadReviews(contentId);  // 삭제 후 리뷰 리스트 갱신
        } else {
            alert('리뷰 삭제에 실패했습니다.');
        }
    }).catch(() => alert('서버 오류로 리뷰 삭제에 실패했습니다.'));
}
