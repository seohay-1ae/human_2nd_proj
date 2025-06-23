<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>나의 뱃지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <style>
        .badge-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
        }

        .badge-list {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .badge-item img {
            width: 100%;
            border-radius: 10px;
        }

        .badge-color {
            filter: none;
        }

        .badge-gray {
            filter: grayscale(100%);
        }
    </style>
</head>
<body>

<nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        나의 뱃지
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<div class="page-container">
    <div class="page-content">
        <div class="container">

            <!-- 상단 필터 -->
            <div class="badge-header">
                <div class="badge-filter">
                    <form method="get" action="${pageContext.request.contextPath}/badges">
                        <select name="unlocked" onchange="this.form.submit()">
                            <option value="" ${empty param.unlocked ? "selected" : ""}>전체</option>
                            <option value="true" ${param.unlocked == 'true' ? "selected" : ""}>해금됨</option>
                            <option value="false" ${param.unlocked == 'false' ? "selected" : ""}>해금되지 않음</option>
                        </select>
                    </form>
                </div>
            </div>

            <!-- 뱃지 목록 -->
            <div class="badge-list">
                <c:forEach var="badge" items="${badgeList}">
                    <div class="badge-item">
                        <a href="${pageContext.request.contextPath}/badges/detail/${badge.badgeId}">
                            <img src="${pageContext.request.contextPath}/badge/${badge.badgeIconPath}"
                                 class="${badge.userBadgeStatus == '1' ? 'badge-color' : 'badge-gray'}"
                                 alt="${badge.badgeName}" />
                        </a>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

</body>
</html>