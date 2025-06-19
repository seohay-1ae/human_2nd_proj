<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${regionKr} ${subregionKr} 관광지 리스트</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        .top-nav {
            position: fixed;
            top: 0;
            width: 100vw; /* 화면 전체 너비 대신 vw로 */
            max-width: 420px; /* 모바일 최대 너비 고정 */
            margin: 0 auto; /* 좌우 중앙 정렬 */
            height: 60px;
            background: #fff;
            border-bottom: 1px solid #ccc;
            display: flex;
            justify-content: center; /* 중앙 정렬 기본 */
            align-items: center;
            z-index: 999;
            left: 0;
            right: 0;
            padding: 0 1rem;
        }

        .regionMap {
            width: 100%;
            height: 100%; /* 전체 채움 */
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 0 10px;
        }

        #svgEmbed {
            width: 100%;
            height: 100%;
            display: block;
        }
    </style>
</head>
<body>
<nav class="top-nav">
    <div class="back-button">
        <a href="/region/${region}">← </a>
    </div>
    <div class="title">
        ${regionKr} ${subregionKr} 관광지 리스트
    </div>
</nav>

<div class="page-container">
    <div class="page-content">
        <c:if test="${not empty placeList}">
            <ul>
                <c:forEach var="place" items="${placeList}">
                    <li>
                        ID: ${place.contentid}, 주소: ${place.addr1}
                    </li>
                </c:forEach>
            </ul>
        </c:if>

        <c:if test="${empty placeList}">
            <p>해당 지역에 관광지 정보가 없습니다.</p>
        </c:if>
    </div>
</div>
<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
</body>
</html>

