<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>관심 글</title>

    <!-- 공통 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <!-- 게시판형 카드와 동일한 룩앤필 -->
    <style>
        .container {
            margin-top: 20px;
        }

        /* 보드 페이지의 .post 스타일 그대로 재사용 */
        .post {
            background-color: #f5f5f5;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 15px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .post-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 5px;
        }

        .post-header .writer {
            color: #1E4CD1; /* 동일한 블루 톤 */
        }

        .post-header .time {
            font-size: 0.9em;
            color: #666;
        }

        .post-content {
            font-size: 1rem;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .post-footer {
            text-align: right;
        }

        .comments-link {
            color: #333;
            text-decoration: none;
            font-size: 0.95em;
        }
    </style>
</head>

<body>
<nav class="top-nav">
    <div class="title">관심 글</div>
</nav>

<div class="page-container">
    <div class="page-content">
        <div class="container">
            <!-- 관심 글 목록 -->
            <c:forEach var="post" items="${heartList}">
                <div class="post">
                    <div class="post-header">
                        <span class="writer">${post.writer}</span>
                        <span class="time">
                            <fmt:formatDate value="${post.createdAt}" pattern="yy-MM-dd HH:mm"/>
                        </span>
                    </div>

                    <div class="post-content">
                            ${post.content}
                    </div>

                    <div class="post-footer">
                        <a href="${pageContext.request.contextPath}/community/comment?id=${post.postId}&source=liked"
                           class="comments-link">
                            💬 ${post.writeCount}
                        </a>
                    </div>
                </div>
            </c:forEach>

            <!-- 관심 글 없을 때 -->
            <c:if test="${empty heartList}">
                <div class="post" style="text-align: center;">
                    관심글이 없습니다.
                </div>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
</body>
</html>
