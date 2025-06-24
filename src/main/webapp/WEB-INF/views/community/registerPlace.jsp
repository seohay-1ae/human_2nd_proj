<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>명소신청</title>

  <!-- 카카오맵 API (appkey를 본인 것으로 교체!) -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=965da81937482b91465d0c491e837eba&libraries=services&autoload=false&libraries=services"></script>

  <!-- 공통 및 페이지별 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

  <style>
        .top-nav {
          position: fixed;
          top: 0;
          width: 100%;
          height: 60px;
          background: #fff;
          border-bottom: 1px solid #ccc;
          display: flex;
          justify-content: space-around;
          align-items: center;
          z-index: 999;
        }
        .logo {
          width: 50%;
        }
        .page-container {
          margin-top: 70px;
        }
        .comments-link {
          text-decoration: none;
          color: inherit;
          margin-left: 10px;
        }
        .write-button {
          margin-top: 30px;
          display: block;
          width: 100%;
          padding: 15px;
          font-size: 16px;
        }
        .likes {
          cursor: pointer;
        }
        .likes i {
          margin-right: 5px;
        }
      </style>
</head>

<body>
  <nav class="top-nav">
      <div class="logo">
          <img src="${pageContext.request.contextPath}/logo.png" alt="logo"/>
      </div>
  </nav>
  <div class="page-container">
    <div class="page-content">
      <div class="container">

        <a href="${pageContext.request.contextPath}/community/notice">공지사항</a>
        <a href="${pageContext.request.contextPath}/community">게시판</a>
        <a href="${pageContext.request.contextPath}/community/registerPlace">명소신청</a>

        <form action="${pageContext.request.contextPath}/community/registerPlace" method="post" enctype="multipart/form-data">
          <input type="text" name="title" placeholder="장소 이름" required />
            <input type="text" id="address" name="address" placeholder="주소" required readonly />
            <div id="map" style="width:400px; height:300px; margin-bottom:15px;"></div>
            <textarea name="description" placeholder="소개글" required></textarea>
            <input type="file" name="imageFile" accept="image/*" required />
            <button type="submit">신청하기</button>
        </form>

      </div>
    </div>
  </div>

  <!-- 하단 nav바 -->
  <jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=965da81937482b91465d0c491e837eba&libraries=services&autoload=false"></script>
  <script>
    // autoload=false이므로, 반드시 아래처럼 래핑!
    kakao.maps.load(function() {
        var mapContainer = document.getElementById('map');
        var mapOption = {
            center: new kakao.maps.LatLng(36.8151, 127.1139),
            level: 3
        };
        var map = new kakao.maps.Map(mapContainer, mapOption);
        var geocoder = new kakao.maps.services.Geocoder();
        var marker = new kakao.maps.Marker({position: map.getCenter()});
        marker.setMap(map);

        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            var latlng = mouseEvent.latLng;
            marker.setPosition(latlng);
            geocoder.coord2Address(latlng.getLng(), latlng.getLat(), function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var addr = result[0].address.address_name;
                    document.getElementById("address").value = addr;
                }
            });
        });
    });
  </script>
</body>
</html>
