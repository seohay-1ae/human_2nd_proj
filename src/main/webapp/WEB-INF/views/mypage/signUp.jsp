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
    <title>회원가입</title>
     <!-- 공통 및 페이지별 CSS -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/> <!-- (필수) -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUp.css"/>
</head>
<body>
    <body>
      <!-- 상단 네비게이션 -->
      <nav class="top-nav">

          <!-- 타이틀 넣을 때 -->
          <div class="title">
             <h2>회원가입</h2>
          </div>
          <!-- 타이틀 넣을 때 -->

        </nav>
        <!-- 상단 네비게이션 -->

    <div class="page-container"> <!-- (필수) -->
        <div class="page-content"> <!-- (필수) -->
          <div class="container"> <!-- (양옆으로 마진20 필요할 때) -->
            <form name="signUpForm" action="/signUp" method="post" onsubmit="return validateForm()">
                    <label for="user_email">이메일</label><br />
                    <input type="email" id="user_email" name="user_email" required placeholder="example@naver.com"/>
                    <button type="button" onclick="checkEmailDuplicate()">중복확인</button>
                    <br/>

                    <label for="user_password">비밀번호</label><br />
                    <input type="password" id="user_password" name="user_password" maxlength=16 required/><br/>

                    <label for="password_check">비밀번호 확인</label><br />
                    <input type="password" id="password_check" name="password_check" maxlength=16 required/><br/>

                    <label for="user_name">이름</label><br />
                    <input type="text" id="user_name" name="user_name" maxlength=4 required/><br />

                    <label for="user_phone_num">휴대폰 번호</label><br />
                    <input type="text" id="user_phone_num" name="user_phone_num" maxlength=11 required/>
                    <button type="button" onclick="sendCertNumber()">인증번호 받기</button>
                    <br/>

                    <label for="cert_number">인증번호</label><br />
                    <input type="text" id="cert_number" name="cert_number" maxlength=6 minlength=6 required/>
                    <button type="button" onclick="verifyCertNumber()" required>인증번호 확인</button>
                    <br/>

                    <br/>
                    <input type="submit" value="회원가입하기"/>
            </form>
          </div>
        </div>
     </div>

     <!-- 하단 nav바 -->
       <jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/> <!-- (필수) -->

    <script src="/js/signUp.js"></script>
</body>
</html>
