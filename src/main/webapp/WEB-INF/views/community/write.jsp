<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>글쓰기</title>

  <!-- 공통 및 페이지별 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
  <style>
      .writer-label{
          margin: 10px 0;
          font-size: 20px;  /* 원하는 텍스트 크기 설정 */
          font-weight: 600;
      }
      textarea {
          width: 380px;
          height: 300px;
          margin-bottom: 10px;
          resize: none;
          overflow: auto;
          padding:10px;
          font-size: 17px;  /* 원하는 텍스트 크기 설정 */
          font-weight: 600;
      }

   </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        글 쓰기
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<!-- 상단 네비게이션 -->
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