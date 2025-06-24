<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${regionKr} ${subregionKr} 관광지 리스트</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        #locationList {
            list-style: none;
            padding: 1rem;
        }

        #locationList li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 1rem;

            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #eee;
        }

        .location-text {
            flex: 1;
        }

        .location-text strong {
            display: block;
            font-size: 16px;
            margin-bottom: 0.3rem;
        }

        .location-text span {
            font-size: 14px;
            color: #555;
        }

        #locationList img {
            width: 100px;
            height: auto;
            object-fit: cover;
            border-radius: 4px;
        }

        #placeModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw; /* 화면 가득 */
            height: 100vh; /* 화면 가득 */
            background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
            z-index: 1000;
            overflow-y: auto; /* 세로 스크롤 */
        }

        .modal-content {
            width: 100vw;
            max-width: 420px;
            margin: 0 auto;
            top: 0;
            height: 100%;
            background: white;
            z-index: 1000;
            padding: 20px;
            overflow-y: auto;
            box-sizing: border-box;
            position: relative;
        }

        #modalClose {
            position: absolute;
            top: 6px;
            right: 3px;
            font-size: 24px;
            font-weight: bold;
            color: #2f65f8; /* 어두운 색상으로 눈에 잘 띄게 */
            cursor: pointer;
            user-select: none; /* 텍스트 드래그 방지 */
            z-index: 1100; /* 모달 내부 다른 요소 위 */
            background: none;
            border-radius: 4px;
        }
    </style>
    <!-- ✅ 카카오맵 SDK (autoload=false 설정 필수) -->
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=965da81937482b91465d0c491e837eba&libraries=services&autoload=false"></script>

</head>
<body>
<nav class="top-nav">
    <div class="title">
        ${regionKr} ${subregionKr} 관광지 리스트
    </div>
</nav>

<div class="page-container">
    <div class="page-content">
        <ul id="locationList"></ul>
    </div>
</div>

<!-- 상세 모달 -->
<div id="placeModal">
    <div class="modal-content">
        <span id="modalClose">×</span>
        <div id="placeDetailContainer">불러오는 중...</div>
    </div>
</div>
<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const region = '${region}';
        const subregion = '${subregion}';

        fetch(`/api/locations?region=\${region}&subregion=\${subregion}`)
            .then(res => res.json())
            .then(locations => {
                console.log(locations);
                const list = document.getElementById('locationList');

                if (locations.length === 0) {
                    list.innerHTML = '<li>관광지가 없습니다.</li>';
                    return;
                }

                locations.forEach(loc => {
                    const li = document.createElement('li');
                    li.classList.add('place-item');
                    li.dataset.id = loc.contentid;  // 상세 조회용 ID
                    <%--console.log(li.loc.contentid)--%>
                    <%--&lt;%&ndash;<p> contentid: ${loc.contentid || ''}</p>&ndash;%&gt;--%>

                    const textDiv = document.createElement('div');
                    textDiv.className = 'location-text';
                    textDiv.innerHTML = `<strong>\${loc.title}</strong><br> <span style="font-size:12px;">\${loc.addr1}</span>`;
                    li.appendChild(textDiv);

                    if (loc.firstimage) {
                        const img = document.createElement('img');
                        img.src = loc.firstimage;
                        img.alt = loc.title;
                        img.width = 100;
                        li.appendChild(img);
                    }
                    list.appendChild(li);
                });
            });

        // 모달 상세 AJAX 로딩
        document.addEventListener('click', function (e) {
            const placeItem = e.target.closest('.place-item');
            if (placeItem) {
                const placeId = placeItem.dataset.id;
                console.log("placeId :" + placeId)

                if (!placeId || isNaN(placeId)) {
                    alert("잘못된 장소 ID입니다.");
                    return;
                }

                fetch(`/place/detail?contentid=\${placeId}`)
                    .then(res => res.text())
                    .then(html => {
                        const container = document.getElementById('placeDetailContainer');
                        container.innerHTML = html;
                        document.getElementById('placeModal').style.display = 'block';

                        // 스크립트 분리 방식으로 JS 로딩 및 초기화
                        const script = document.createElement('script');
                        script.src = '${pageContext.request.contextPath}/js/placeDetail.js';
                        script.onload = () => {
                            initPlaceModal(placeId);  // 외부 JS의 함수 실행
                        };
                        document.body.appendChild(script);
                    });
            }
            // 모달 닫기 버튼 처리
            if (e.target.id === 'modalClose') {
                document.getElementById('placeModal').style.display = 'none';
                document.getElementById('placeDetailContainer').innerHTML = '';
            }
        });
    });
</script>
</body>
</html>

