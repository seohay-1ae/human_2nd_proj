<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>관광지 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
</head>
<body>
<nav class="top-nav">
    <div class="page-title">
        <h1>${region} / ${subregion} 관광지 리스트</h1>
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

