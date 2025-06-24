<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>댓글 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        .post-box {
            margin: 20px 0;
        }

        .post-header {
            line-height: 1.5 !important;
        }
        .comment-list{
            margin: 20px 0;
        }
        .comment-box{
            background-color: #f5f5f5;
            margin-bottom: 10px;
            border-radius: 10px;
            padding:10px;
        }
        textarea {
            width: 380px;
            height: 80px;
            margin-bottom: 10px;
            resize: none;
            overflow: auto;
            padding:10px;
            font-size: 12px;  /* 원하는 텍스트 크기 설정 */
            font-weight: 400;
        }
        .comment-form button {
            float: right;
        }
    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">
    <!-- 뒤로가기 넣을 때 -->
    <div class="back-button">
        <a href="/community">← </a>
    </div>
    <!-- 뒤로가기 넣을 때 -->

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        댓글 작성
    </div>
    <!-- 타이틀 넣을 때 -->
</nav>
<div class="page-container">
    <div class="page-content">
        <div class="container">


            <!-- 게시글 정보 -->
            <div class="post-box">
                <div class="post-header">
                    <strong>작성자:</strong> ${post.writer} <br/>
                    <strong>작성일:</strong> ${post.createdAt} <br/><br/>
                </div>
                <div class="post-body">
                    <div>${post.content}</div>
                </div>
            </div>

            <!-- 댓글 목록 -->
            <hr/>
            <h4 style="margin-top: 5px;">댓글 목록</h4>
            <div class="comment-list">
                <c:forEach var="comment" items="${post.comments}">
                    <div class="comment-box">
                        <strong>${comment.writer}</strong> (${comment.createdAt})<br/>
                            ${comment.content}
                    </div>
                </c:forEach>
            </div>


            <!-- 댓글 작성 폼 -->
            <div class="comment-form">
                <div class="form-box">
                    <form action="${pageContext.request.contextPath}/community/comment/write" method="post">
                        <input type="hidden" name="postId" value="${post.postId}"/>
                        <textarea name="content" placeholder="댓글을 입력하세요" required></textarea>
                        <button type="submit">등록</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>