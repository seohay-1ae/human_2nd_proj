<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>제목</title>

  <!-- 공통 및 페이지별 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/각 페이지에서만 쓰이는 css(만들것).css"/>
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

            .koreaMap {
                width: 80%;
                margin: 10px auto 0 auto;
                padding:0;
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

        <form id="postForm" class="post-form" action="${pageContext.request.contextPath}/community/write" method="post">
            <div class="writer-label">작성자: ${userName}</div>

          <textarea name="content" placeholder="지금 하고있는 생각을 쓰세요!" required></textarea>
        </form>
        <button form="postForm" type="submit" class="post-btn">게시</button>
      </div>
    </div>
 </div>

  <!-- 하단 nav바 -->
  <jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/> (

  <script>
    <!-- js 작성 -->
  </script>
</body>
</html>