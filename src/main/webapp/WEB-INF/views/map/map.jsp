<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>카카오 지도</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/map.css">

    <style>
        #map {
            width: 100vw;
            height: 100vh;
        }
    </style>
    <!-- ✅ 카카오맵 SDK (autoload=false 설정 필수) -->
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=965da81937482b91465d0c491e837eba&libraries=services&autoload=false"></script>
</head>
<body>
<nav class="top-nav">
    <div class="page-title">
        <h2>내 위치</h2>
    </div>
</nav>
<div class="page-container">
    <div class="page-content">

        <div id="map"></div>
        <!-- 요약 오버레이 -->
        <div id="place-detail" style="display:none; position:fixed; bottom:60px; left:0; width:100%;
    background:white; border-top:1px solid #ccc; padding:15px; z-index:500;"></div>

        <!-- 전체화면 모달 -->
        <div id="detail-modal" style="display:none; position:fixed; top:0; left:0; width:100%;
    height:100%; background:white; z-index:1000; padding:20px; overflow-y:auto;">
            <button onclick="closeModal()" style="float:right;">닫기</button>
            <div id="modal-tabs" style="margin-top:40px; margin-bottom:20px;"></div>
            <div id="modal-content"></div>
        </div>


    </div>
</div>
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
<!-- ✅ 우리가 만든 외부 JS -->
<script src="/js/map.js"></script>
</body>
</html>
