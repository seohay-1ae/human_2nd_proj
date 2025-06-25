<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>공지사항</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        .page-content {
            position: relative;
            padding-bottom: 230px; /* 배너 높이 + 여유 공간 */
        }

        .banner {
            position: absolute;
            bottom: 55px;
            width: 420px;
            text-align: center;
            z-index: 1000; /* 충분히 큰 값으로 설정 */
        }

        .top-link {
            margin: 20px 0;
        }

        .top-link a {
            font-size: 18px;
            font-weight: 600;
            margin-right: 15px; /* 원하는 간격 설정 */
        }
        .notice-list { margin-top: 20px; }

        .notice-card {
            background: #f5f5f5;
            border-radius: 10px;
            padding: 12px 14px;
            margin-bottom: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,.1);

            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            transition: background .15s ease;
        }
        .notice-card:hover { background: #e9e9e9; }

        .notice-title { color: black; font-weight: 600; }
        .notice-date  { color: #666; font-size: .9rem; }
    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">
    <div class="title">공지사항</div>
</nav>
<!-- // 상단 네비게이션 -->

<div class="page-container">
    <div class="page-content">
        <div class="container">
            <!-- 상단 링크 -->
            <div class="top-link">
                <a href="${pageContext.request.contextPath}/community/notice" style="color:#1E4CD1">공지사항</a>
                <a href="${pageContext.request.contextPath}/community">게시판</a>
                <a href="${pageContext.request.contextPath}/community/registerPlace">명소신청</a>
            </div>

            <!-- 공지사항 목록 -->
            <div class="notice-list">
                <c:forEach var="notice" items="${list}">
                    <div class="notice-card clickable-row"
                         data-href="${pageContext.request.contextPath}/community/notice/${notice.noticeId}">
                        <span class="notice-title">${notice.title}</span>
                        <span class="notice-date">
        <fmt:formatDate value="${notice.regDate}" pattern="yy-MM-dd"/>
      </span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 배너 이미지 -->
    <div class="banner">
        <img src="${pageContext.request.contextPath}/banner.png" alt="banner" />
    </div>
</div>

<!-- 하단 네비게이션 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.clickable-row').forEach(row => {
            row.addEventListener('click', () => {
                const href = row.dataset.href;
                if (href) window.location.href = href;
            });
        });
    });
</script>
</body>
</html>