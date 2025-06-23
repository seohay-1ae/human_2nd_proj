<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>게시판</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" />

  <style>
    .top-nav {
      position: fixed;
      top: 0;
      width: 100%;
      height: 60px;
      background: #fff;
      border-bottom: 1px solid #ccc;
      display: flex;
      justify-content: space-around;
      align-items: center;
      z-index: 999;
    }
    .logo {
      width: 50%;
    }
    .page-container {
      margin-top: 70px;
    }
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
    }
    .likes i {
      margin-right: 5px;
    }
  </style>
</head>

<body>
  <nav class="top-nav">
    <div class="logo">
      <img src="${pageContext.request.contextPath}/logo.png" alt="logo"/>
    </div>
  </nav>

  <div class="page-container">
    <div class="page-content">
      <div class="container">
        <div class="post-list">
          <a href="${pageContext.request.contextPath}/community/notice">공지사항</a>
          <a href="${pageContext.request.contextPath}/community">게시판</a>
          <a href="${pageContext.request.contextPath}/community/registerPlace">명소신청</a>
          <c:forEach var="post" items="${posts}">
            <div class="post">
              <div class="post-header">
                <span class="writer">${post.writer}</span>
                <span class="time"><fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm" /></span>
              </div>
              <div class="post-content">
                <p>${post.content}</p>
                <button class="reportBtn" data-postid="${post.postId}">🚨 신고</button>
              </div>
              <div class="post-footer">
                <!-- ❤️ 좋아요 버튼 -->
                <span class="likes" data-post-id="${post.postId}">
                  <i class="${post.likedByUser ? 'fa-solid' : 'fa-regular'} fa-heart"></i>
                  <span class="like-count">${post.heartCount}</span>
                </span>

                <!-- 💬 댓글 링크 -->
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
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify({ postId: Number(postId) })  // 🔧 숫자 변환!
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
                body: JSON.stringify({ postId })
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
