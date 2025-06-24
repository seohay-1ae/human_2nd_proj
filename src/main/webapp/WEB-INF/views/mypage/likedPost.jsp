<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>관심 글</title>

    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/각 페이지에서만 쓰이는 css(만들것).css"/>--%>
    <!-- Font Awesome CDN (최신 버전 및 integrity 없는 버전) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <style>

        .post-box {
            border-radius: 10px;
            width: 380px;                 /* 고정 너비 */
            background-color: #f5f5f5;
            margin: 1rem auto;            /* 가운데 정렬 */
            padding: 1rem;
            box-sizing: border-box;
        }

        .post-author {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }

        .post-content {
            border-bottom: 1px solid #ccc;
            padding: 20px 0;
        }

        .likes-comments {
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 뒤로가기 넣을 때 -->
    <div class="back-button">
        <a href="/mypage">← </a>
    </div>
    <!-- 뒤로가기 넣을 때 -->

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        관심 글
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<div class="page-container">
    <div class="page-content">

        <div class="post-box">
            <div class="post-author">
                <p>최영범&nbsp;&nbsp;&nbsp;<span>...</span></p>
            </div>

            <div class="post-content">
                나는 개인적으로 천안 명소들이 제일 좋은 듯?
            </div>
            <div class="likes-comments">
                하트14개 메세지 8개
            </div>
        </div>

            <div class="post-box">
                <div class="post-author">
                    <p>최영범&nbsp;&nbsp;&nbsp;<span>...</span></p>
                </div>

                <div class="post-content">
                    나는 개인적으로 천안 명소들이 제일 좋은 듯?
                </div>
                <div class="likes-comments">
                    하트14개 메세지 8개
                </div>
            </div>
        </div>
    </div>

    <!-- 하단 nav바 필수 -->
    <jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

    <script>
        <!-- js 작성 -->
    </script>
</body>
</html>