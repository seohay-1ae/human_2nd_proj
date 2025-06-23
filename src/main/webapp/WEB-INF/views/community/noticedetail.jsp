<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>명소신청</title>


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
        <h2>${notice.title}</h2>
            <p><strong>작성일:</strong> <fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd"/></p>
            <hr/>
            <div>
                ${notice.content}
            </div>

            <br/>
            <a href="${pageContext.request.contextPath}/admin/notice">목록으로</a>
        <a href="${pageContext.request.contextPath}/community/notice">공지사항</a>
        <a href="${pageContext.request.contextPath}/community">게시판</a>
        <a href="${pageContext.request.contextPath}/community/registerPlace">명소신청</a>





      </div>
    </div>
 </div>

  <!-- 하단 nav바 -->
  <jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

  <script>
    <!-- js 작성 -->
  </script>
</body>
</html>