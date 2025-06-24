<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>게시판</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
          crossorigin="anonymous"/>

    <style>
        .page-content {
            position: relative;
            padding-bottom: 190px; /* 배너 높이 + 여유 공간 */
        }

        .post-header {
            display: flex;
            align-items: center;
            gap: 10px; /* 작성자와 시간 사이 간격 */
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

        .reportBtn {
            background-color: #ff4d69;
            padding: 4px 7px;
            margin-left: auto; /* 오른쪽 끝으로 밀기 */
        }

        .reportBtn:hover {
            background-color: #e73d57;
        }

        .post {
            background-color: #f5f5f5;
            margin-bottom: 10px;
            border-radius: 10px;
            padding: 10px;
        }
    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        게시판
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<!-- 상단 네비게이션 -->

<div class="page-container">
    <div class="page-content">
        <div class="container">

            <div class="top-link">
                <a href="${pageContext.request.contextPath}/community/notice">공지사항</a>
                <a href="${pageContext.request.contextPath}/community" style="color: #1E4CD1">게시판</a>
                <a href="${pageContext.request.contextPath}/community/registerPlace">명소신청</a>
            </div>

            <div class="post-list">
                <c:forEach var="post" items="${posts}">
                    <div class="post">
                        <div class="post-header">
                            <span class="writer" style="color: blue">${post.writer}</span>
                            <span class="time" style="color: black"><fmt:formatDate value="${post.createdAt}"
                                                                                    pattern="yyyy-MM-dd HH:mm"/></span>
                            <button class="reportBtn" data-postid="${post.postId}">⚠️ 신고</button>
                        </div>
                        <div class="post-content">
                            <p style="font-weight: 600; font-size: 18px !important; margin-bottom: 2px;">${post.content}</p>
                        </div>
                        <div class="post-footer">
                            <!-- ❤️ 좋아요 버튼 -->
                            <span class="likes" data-post-id="${post.postId}">
                              <i class="${post.likedByUser ? 'fa-solid' : 'fa-regular'} fa-heart"
                                 style="color: red;"></i>
                              <span class="like-count" style="color: black;">${post.heartCount}</span>
                            </span>

                            <!-- 💬 댓글 링크 -->
                            <a href="${pageContext.request.contextPath}/community/comment?id=${post.postId}"
                               class="comments-link">
                                💬 ${post.writeCount}
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="write-button">
                <a href="${pageContext.request.contextPath}/community/write">
                    <button type="button" class="write-button">
                        <i class="fas fa-edit"></i> 글쓰기
                    </button>
                </a>
            </div>
        </div>
    </div>
    <div class="banner">
        <img src="${pageContext.request.contextPath}/banner.png" alt="banner"/>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const contextPath = "${pageContext.request.contextPath}";

        document.querySelectorAll('.likes').forEach(like => {
            const icon = like.querySelector('i');
            const countSpan = like.querySelector('.like-count');
            const postId = like.dataset.postId;

            like.addEventListener('click', async () => {
                const wasSolid = icon.classList.contains('fa-solid');
                icon.classList.toggle('fa-solid');
                icon.classList.toggle('fa-regular');

                try {
                    const res = await fetch(`${contextPath}/community/heart`, {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify({postId: Number(postId)})  // 🔧 숫자 변환!
                    });

                    if (!res.ok) throw new Error('서버 응답 실패');

                    const json = await res.json();
                    countSpan.textContent = json.heartCount;
                } catch (e) {
                    // 오류 발생 시 아이콘 원복
                    icon.classList.toggle('fa-solid', wasSolid);
                    icon.classList.toggle('fa-regular', !wasSolid);
                    console.error('하트 처리 오류:', e);
                    alert('하트를 처리할 수 없습니다.');
                }
            });
        });
    });

    document.addEventListener("DOMContentLoaded", function () {
        const contextPath = "${pageContext.request.contextPath}";

        document.querySelectorAll(".reportBtn").forEach((btn) => {
            btn.addEventListener("click", async function () {
                const postId = this.dataset.postid;

                const confirmed = confirm("정말 이 게시글을 신고하시겠습니까?");
                if (!confirmed) return;

                try {
                    const res = await fetch(`${contextPath}/community/report`, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({postId})
                    });

                    const result = await res.text();
                    alert(result);
                } catch (e) {
                    alert("신고 중 오류가 발생했습니다.");
                    console.error(e);
                }
            });
        });
    });


</script>


</body>
</html>
