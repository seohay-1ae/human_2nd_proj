<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>명소신청</title>

    <!-- 카카오맵 API (appkey를 본인 것으로 교체!) -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=965da81937482b91465d0c491e837eba&libraries=services&autoload=false&libraries=services"></script>

    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        .page-content {
            position: relative;
            padding-bottom: 190px; /* 배너 높이 + 여유 공간 */
        }

        .banner {
            position: absolute;
            bottom: 55px;
            width: 420px;
            text-align: center;
        }

        .top-link {
            margin: 20px 0;
        }

        .top-link a {
            font-size: 18px;
            font-weight: 600;
            margin-right: 15px; /* 원하는 간격 설정 */
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        form button {
            margin-left: auto; /* 오른쪽으로 밀기 */
        }

        .form-input {
            width: 380px;
            height: 25px;
            margin-bottom: 10px;
            box-sizing: border-box; /* padding 포함한 크기 계산 */
            padding:10px;
            font-size: 12px;  /* 원하는 텍스트 크기 설정 */
            font-weight: 400;
        }

        #map {
            width: 380px;
            height: 300px;
            margin-bottom: 15px;
        }

        .file-and-button {
            display: flex;
            align-items: center;
            width: 378px;
            margin-top: 10px;
        }

        .file-and-button input[type="file"] {
            flex: 1;
        }

        .file-and-button button {
            margin-left: auto;
            padding: 5px 15px;
        }

        textarea {
            width: 380px;
            height: 80px;
            margin-bottom: 10px;
            resize: none;
            overflow: auto;
            padding:10px;
            font-size: 12px;  /* 원하는 텍스트 크기 설정 */
            font-weight: 400;
        }
    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        명소 신청
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<!-- 상단 네비게이션 -->

<div class="page-container">
    <div class="page-content">
        <div class="container">

            <div class="top-link">
                <a href="${pageContext.request.contextPath}/community/notice">공지사항</a>
                <a href="${pageContext.request.contextPath}/community">게시판</a>
                <a href="${pageContext.request.contextPath}/community/registerPlace" style="color: #1E4CD1">명소신청</a>
            </div>

            <form action="${pageContext.request.contextPath}/community/registerPlace" method="post"
                  enctype="multipart/form-data">
                <input type="text" name="title" placeholder="장소 이름" required class="form-input"/>
                <input type="text" id="address" name="address" placeholder="주소" required readonly class="form-input"/>
                <div id="map"></div>
                <textarea name="description" placeholder="소개글" required=""></textarea>

                <div class="file-and-button">
                    <input type="file" name="imageFile" accept="image/*" required/>
                    <button type="submit">신청하기</button>
                </div>
            </form>

        </div>
    </div>
    <div class="banner">
        <img src="${pageContext.request.contextPath}/banner.png" alt="banner"/>
    </div>
</div>

<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=965da81937482b91465d0c491e837eba&libraries=services&autoload=false"></script>
<script>
    // autoload=false이므로, 반드시 아래처럼 래핑!
    kakao.maps.load(function () {
        var mapContainer = document.getElementById('map');
        var mapOption = {
            center: new kakao.maps.LatLng(36.8151, 127.1139),
            level: 3
        };
        var map = new kakao.maps.Map(mapContainer, mapOption);
        var geocoder = new kakao.maps.services.Geocoder();
        var marker = new kakao.maps.Marker({position: map.getCenter()});
        marker.setMap(map);

        kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
            var latlng = mouseEvent.latLng;
            marker.setPosition(latlng);
            geocoder.coord2Address(latlng.getLng(), latlng.getLat(), function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var addr = result[0].address.address_name;
                    document.getElementById("address").value = addr;
                }
            });
        });
    });

    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('success')) {
        alert("명소 신청이 완료되었습니다!");
        history.replaceState({}, document.title, location.pathname); // ?success 제거
    }
    if (urlParams.has('error')) {
        alert("신청에 실패했습니다. 다시 시도해주세요.");
    }
</script>
</body>
</html>
