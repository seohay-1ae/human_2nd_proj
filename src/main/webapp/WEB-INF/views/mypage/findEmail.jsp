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
    <title>이메일 찾기</title>
    <script src="/js/findEmail.js"></script>
</head>
<body>
    <h2>이메일 찾기</h2>
    <form name="findEmailForm" action="/findEmail" method="post" onsubmit="return validateForm()">
        이름<br />
        <input type="text" name="username" maxlength=4 required/><br />
        휴대폰 번호<br />
        <input type="text" name="phone_number" maxlength=11 required/>
        <button type="button" onclick="sendCertNumber()">인증번호 받기</button>
        <br/>
        인증번호<br />
        <input type="text" name="cert_number" maxlength=6 minlength=6 required/>
        <button type="button" onclick="verifyCertNumber()" required>인증번호 확인</button>
        <br/>
        <br/>
        <input type="submit" value="다음"/>
    </form>
</body>
</html>
