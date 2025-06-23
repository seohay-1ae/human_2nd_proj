<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Bootstrap Icons (최신 버전 CDN) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
    <title>카카오 지도</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/map.css">

    <style>
        #map {
            width: 100%;
            height: 100%;
            display: block;
        }

    </style>
    <!-- ✅ 카카오맵 SDK (autoload=false 설정 필수) -->
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=965da81937482b91465d0c491e837eba&libraries=services&autoload=false"></script>
</head>
<body>
<nav class="top-nav">
    <div class="title">
        내 위치
    </div>
    <button id="gps-button" style="position: absolute; top: 10px; right: 10px; z-index: 1000;">
<%--        📍 내 위치--%>
    <i class="bi bi-crosshair2"></i>
    </button>
</nav>
<div class="page-container">
    <div class="page-content">
        <div id="map"></div>
        <!-- 요약 오버레이 -->
        <div id="place-detail" style="display:none; position:fixed; bottom:60px; width: 100vw;
            max-width: 420px; margin: 0 auto; background:white; border-top:1px solid #ccc;
            padding:15px; z-index:500;"></div>

        <!-- 전체화면 모달 -->
        <div id="placeModal" style="display:none; position:fixed; width: 100vw;
            max-width: 420px; margin: 0 auto; top:0; height: 100%;
            background:white; z-index:1000; padding:20px; overflow-y:auto;">
            <button id="modalClose" style="float:right;">닫기</button>
            <div id="placeDetailContainer"></div>
            <!-- 여기 안에 AJAX로 불러올 상세내용이 들어갑니다 -->
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<!-- ✅ 우리가 만든 외부 JS -->
<script src="/js/map.js"></script>

</body>
</html>
