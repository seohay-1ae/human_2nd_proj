<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>관심 글</title>

    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <style>
        .post-box {
            border-radius: 10px;
            width: 380px; /* 고정 너비 */
            background-color: #f5f5f5;
            margin: 1rem auto; /* 가운데 정렬 */
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
        <!-- 실제 데이터 뿌리기 -->
        <c:forEach var="post" items="${heartList}">
            <div class="post-box">
                <div class="post-author">
                    <p>${post.writer}&nbsp;&nbsp;&nbsp;<span>...</span></p>
                </div>
                <div class="post-content">
                        ${post.content}
                </div>
                <div class="likes-comments">
                    <a href="${pageContext.request.contextPath}/community/comment?id=${post.postId}&source=liked"
                       class="comments-link">
                        💬 ${post.writeCount}
                    </a>
                </div>
            </div>
        </c:forEach>
        <!-- 데이터 없을 때 -->
        <c:if test="${empty heartList}">
            <div class="post-box" style="text-align:center;">
                관심글이 없습니다.
            </div>
        </c:if>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    <!-- js 작성 -->
</script>
</body>
</html>
