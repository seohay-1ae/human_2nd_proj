<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>내가 쓴 글</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <style>

        .container{
            margin-top: 20px;
        }

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
            color: #1E4CD1;
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
        .likes i, .comments-link i {
            transition: transform 0.25s ease, filter 0.25s ease;
            cursor: pointer;
            display: inline-block; /* transform 제대로 적용하려면 */
        }

        .likes i:hover, .comments-link i:hover {
            transform: translateY(-2px) scale(1.1);
            filter: drop-shadow(0 4px 6px rgba(0, 0, 0, 0.25));
        }
    </style>
</head>

<body>
<nav class="top-nav">
    <div class="title">내가 쓴 글</div>
</nav>

<div class="page-container">
    <div class="page-content">
        <div class="container">
            <c:forEach var="post" items="${myPostList}">
                <div class="post">
                    <div class="post-header">
                        <span class="writer" >${post.writer}</span>
                        <span class="time">
            <fmt:formatDate value="${post.createdAt}" pattern="yy-MM-dd HH:mm"/>
          </span>
                    </div>

                    <div class="post-content">
                            ${post.content}
                    </div>

                    <div class="post-footer">
                        <a href="${pageContext.request.contextPath}/community/comment?id=${post.postId}&source=my" class="comments-link">
                            <i class="fa-regular fa-comment"></i> ${post.writeCount}
                        </a>

                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty myPostList}">
                <div class="post" style="text-align: center;">
                    내가 쓴 글이 없습니다.
                </div>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
</body>
</html>
