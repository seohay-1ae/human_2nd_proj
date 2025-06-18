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
    <script src="/js/signup.js"></script>
</head>
<body>
    <h2>회원가입</h2>
    <form name="signupForm" action="/signup" method="post" onsubmit="return validateForm()">
        이메일<br />
        <input type="email" name="email" required placeholder="example@naver.com"/>
        <button type="button" onclick="checkEmailDuplicate()">중복확인</button>
        <br/>
        비밀번호<br />
        <input type="password" name="password" required/><br/>
        비밀번호 확인<br />
        <input type="password" name="password_check" required/><br/>
        이름<br />
        <input type="text" name="username" required/><br />
        휴대폰 번호<br />
        <input type="text" name="phone_number" required/>
        <button type="button">인증번호 받기</button>
        <br/>
        인증번호<br />
        <input type="text" name="cert_number" required/>
        <button type="button">인증번호 확인</button>
        <br/>
        <br/>
        <input type="submit" value="회원가입하기"/>
    </form>
</body>
</html>
