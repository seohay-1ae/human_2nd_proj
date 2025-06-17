<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>관광지 목록</title>
</head>
<body>
<h1>${region} / ${subregion} 관광지 리스트</h1>

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
</body>
</html>

