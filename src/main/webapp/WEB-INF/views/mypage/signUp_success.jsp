<%--
  Created by IntelliJ IDEA.
  User: usbtt
  Date: 25. 6. 11.
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입 완료</title>
    <script src="/js/signUp.js"></script>
     <!-- 공통 및 페이지별 CSS -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/> <!-- (필수) -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/<!--각 페이지에서만 쓰이는 css(만들것).css -->"/>
</head>
<body>
      <!-- 상단 네비게이션 -->
      <nav class="top-nav">

          <!-- 타이틀 넣을 때 -->
          <div class="title">
             <h2>회원가입 완료</h2>
          </div>
          <!-- 타이틀 넣을 때 -->

        </nav>
        <!-- 상단 네비게이션 -->

    <div class="page-container"> <!-- (필수) -->
        <div class="page-content"> <!-- (필수) -->
          <div class="container"> <!-- (양옆으로 마진20 필요할 때) -->
                <p>아이디: ${user_email}</p>
                <p>환영합니다. ${user_name} 님!</p>
                <form action="${pageContext.request.contextPath}/loginSelect" method="get">
                    <button type="submit" class="signUp_check">확인</button>
                </form>
          </div>
        </div>
     </div>
</body>
</html>
