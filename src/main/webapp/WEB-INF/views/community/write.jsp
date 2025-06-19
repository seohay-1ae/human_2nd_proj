<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>글쓰기</title>
    <style>
        .post-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            z-index: 1000;
        }
    </style>
    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
</head>

<body>
<nav class="top-nav">
    <div class="back-button">
        <a href="/community">← </a>
    </div>
    <div class="title">
        글쓰기
    </div>
    <button form="postForm" type="submit" class="post-btn">게시</button>
</nav>
<div class="page-container">
    <div class="page-content">
        <div class="container">

            <form id="postForm" class="post-form" action="${pageContext.request.contextPath}/community/write"
                  method="post">
                <div class="writer-label">작성자: 최영범</div>
                <input type="hidden" name="writer" value="최영범"/>

                <textarea name="content" placeholder="지금 하고있는 생각을 쓰세요!" required></textarea>
            </form>
        </div>
    </div>
</div>

<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
(

<script>
    <!-- js 작성 -->
</script>
</body>
</html>