<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>뱃지 연결</title>


    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        /* 기본 테이블 스타일 */
        table {
            border-collapse: collapse;
            border: 2px solid #ccc;
            min-width: 800px;
            width: 100%;
        }

        thead th {
            background-color: #b3e9ee;
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
            white-space: nowrap;
        }

        tbody td {
            border: 1px solid #ccc;
            padding: 10px;
            vertical-align: top;
        }

        .table-container {
            overflow-x: auto;
            max-width: 100%;
            margin: 20px 0;
        }

        /* 말줄임표용 셀 */
        .ellipsis {
            max-width: 150px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* 줄바꿈 방지용 셀 */
        .nowrap {
            white-space: nowrap;
        }

        /* 버튼 그룹 */
        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .action-buttons button {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
        }

    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">
    <div class="title">
        <h2>관리자 페이지</h2>
    </div>
</nav>

<div class="page-container">
    <div class="page-content">
        <div class="container">

            <div class="top-link">
                <a href="${pageContext.request.contextPath}/admin/adminPage" class="tab-button">사용자 관리</a>
                <a href="${pageContext.request.contextPath}/admin/notice" class="tab-button">커뮤니티</a>
                <a href="${pageContext.request.contextPath}/admin/adminBadgePage" class="tab-button" style="color: #1E4CD1;">뱃지</a>
            </div>

            <h2 style="margin-top: 10px;">뱃지 등록</h2>

            <div class="table-container">
                <table border="1">
                    <thead>
                    <tr>
                        <th>명소명</th>
                        <th>주소</th>
                        <th>소개글</th>
                        <th>이미지</th>
                        <th>뱃지설정</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="place" items="${list}">
                        <tr>
                            <td class="ellipsis">${place.title}</td>
                            <td class="ellipsis">${place.address}</td>
                            <td class="ellipsis">${place.description}</td>
                            <td>
                                <c:if test="${not empty place.imageUrl}">
                                    <img src="${pageContext.request.contextPath}/upload/${place.imageUrl}" width="80"/>
                                </c:if>
                            </td>
                            <td><button>설정</button></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

</body>
</html>