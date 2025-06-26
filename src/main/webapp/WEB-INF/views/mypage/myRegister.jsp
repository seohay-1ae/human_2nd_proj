<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>내가 신청한 명소</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        .page-container {
            padding: 20px;
        }

        .place-list {
            margin-top: 20px;
        }

        .place-card {
            background: #f5f5f5;
            border-radius: 10px;
            padding: 12px 14px;
            margin-bottom: 12px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, .1);
            transition: background .15s ease;
        }

        .place-header {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 8px;
        }

        .place-title {
            font-weight: 700;
            color: #1E4CD1;
        }

        .place-writer {
            margin-left: auto;
            white-space: nowrap;
            color: #555;
            font-size: .9rem;
        }

        .place-address {
            flex-basis: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color: #333;
        }

        .place-desc {
            margin: 6px 0;
            color: #222;
            font-size: .95rem;
        }

        .place-meta {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .place-image {
            width: 250px;
            flex-shrink: 0;
            border-radius: 6px;
            object-fit: cover;
        }

        .place-date {
            font-size: .85rem;
            color: #666;
            white-space: nowrap;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">
    <!-- 타이틀 넣을 때 -->
    <div class="title">
        내가 신청한 명소
    </div>
</nav>

<div class="page-container"> <!-- (필수) -->
    <div class="page-content"> <!-- (필수) -->
        <div class="container"> <!-- (양옆으로 마진20 필요할 때) -->
            <c:choose>
                <c:when test="${empty myPlaces}">
                    <p>아직 신청한 명소가 없습니다.</p>
                </c:when>
                <c:otherwise>
                    <div class="place-list">
                        <c:forEach var="place" items="${myPlaces}">
                            <div class="place-card">
                                <div class="place-header">
                                    <span class="place-title">${place.title}</span>
                                    <span class="place-address">${place.address}</span>
                                </div>
                                <div class="place-desc">
                                        ${place.description}
                                </div>
                                <div class="place-meta">
                                    <c:if test="${not empty place.imageUrl}">
                                        <img src="${pageContext.request.contextPath}/upload/${place.imageUrl}"
                                             alt="명소 이미지" class="place-image"/>
                                    </c:if>
                                </div>
                                <div class="place-date">
                                    <fmt:formatDate value="${place.createdAt}" pattern="yyyy-MM-dd"/>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
</body>
</html>
