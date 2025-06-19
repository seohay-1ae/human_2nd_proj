<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>커뮤니티</title>

    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>

        .comments-link {
            text-decoration: none;
            color: inherit;
            margin-left: 10px;
        }

        .write-button {
            margin-top: 30px;
            display: block;
            width: 100%;
            padding: 15px;
            font-size: 16px;
        }

        .likes {
            cursor: pointer;
            font-size: 16px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .like-count {
            font-weight: bold;
        }
    </style>
</head>
<body>

<nav class="top-nav">
    <div class="tab">
        탭 넣을거임
    </div>
</nav>

<div class="page-container">
    <div class="page-content">
        <div class="container">
            <div class="post-list">
                <c:forEach var="post" items="${posts}">
                    <div class="post">
                        <div class="post-header">
                            <span class="writer">${post.writer}</span>
                            <span class="time">${post.createdAt}</span>
                        </div>
                        <div class="post-content">
                            <p>${post.content}</p>
                        </div>
                        <div class="post-footer">
                            <!-- 하트 + 숫자 -->
                            <span class="likes">
                  <i class="fa-regular fa-heart"></i>
                  <span class="like-count">${post.heartCount}</span>
                </span>

                            <!-- 댓글 링크 -->
                            <a href="${pageContext.request.contextPath}/community/comment?id=${post.postId}" class="comments-link">
                                💬 ${post.writeCount}
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="${pageContext.request.contextPath}/community/write">
                <button type="button" class="write-button">
                    <i class="fas fa-edit"></i> 글쓰기
                </button>
            </a>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        console.log("하트 토글 스크립트 로드됨");

        document.querySelectorAll('.likes').forEach(like => {
            const icon = like.querySelector('i');
            const countSpan = like.querySelector('.like-count');

            like.addEventListener('click', () => {
                const isLiked = icon.classList.contains('fa-solid');

                icon.classList.toggle('fa-solid');
                icon.classList.toggle('fa-regular');

                let count = parseInt(countSpan.textContent.trim(), 10);
                if (!isNaN(count)) {
                    count = isLiked ? count - 1 : count + 1;
                    countSpan.textContent = count;
                }
            });
        });
    });
</script>
</body>
</html>
