<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>공지사항</title>

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

        table {
            width: 100%;
            border-collapse: collapse; /* 테두리 겹침 제거 */
            border: 2px solid #ccc; /* 테이블 전체 테두리 */
        }

        thead th {
            background-color: #b3e9ee;
            border: 1px solid #ccc; /* 셀 테두리 */
            padding: 10px;
            text-align: left;
        }

        tbody td {
            border: 1px solid #ccc; /* 셀 테두리 */
            padding: 10px;
        }

        tbody tr:hover {
            background-color: #a5d3d9; /* 선택 사항: 마우스오버 효과 */
        }
        .clickable-row {
            cursor: pointer;
        }
    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        공지사항
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<!-- 상단 네비게이션 -->
<div class="page-container">
    <div class="page-content">
        <div class="container"> <!-- (양옆으로 마진20 필요할 때) -->

            <div class="top-link">
                <a href="${pageContext.request.contextPath}/community/notice" style="color: #1E4CD1">공지사항</a>
                <a href="${pageContext.request.contextPath}/community">게시판</a>
                <a href="${pageContext.request.contextPath}/community/registerPlace">명소신청</a>
            </div>

            <table border="1" width="100%">
                <thead>
                <tr>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="notice" items="${list}">
                    <tr class="clickable-row" data-href="${pageContext.request.contextPath}/community/notice/${notice.noticeId}">
                        <td>${notice.title}</td>
                        <td>
                            <fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
        <div class="banner">
            <img src="${pageContext.request.contextPath}/banner.png" alt="banner"/>
        </div>
</div>

<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const rows = document.querySelectorAll(".clickable-row");
        rows.forEach(row => {
            row.addEventListener("click", function () {
                const href = this.dataset.href;
                if (href) {
                    window.location.href = href;
                }
            });
        });
    });
</script>
</body>
</html>