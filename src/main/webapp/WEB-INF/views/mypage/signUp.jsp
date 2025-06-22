<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/> <!-- (필수) -->
    <script src="/js/signUp.js"></script>
</head>
<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">
    <!-- 뒤로가기 넣을 때 -->
    <div class="back-button">
        <a href="loginSelect">← </a>
    </div>
    <!-- 뒤로가기 넣을 때 -->

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        회원가입
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<div class="page-container"> <!-- (필수) -->
    <div class="page-content"> <!-- (필수) -->
        <div class="container"> <!-- (양옆으로 마진20 필요할 때) -->
            <form name="signUpForm" action="/signUp" method="post" onsubmit="return validateForm()">
                이메일<br/>
                <input type="email" name="email" required placeholder="example@naver.com"/>
                <button type="button" onclick="checkEmailDuplicate()">중복확인</button>
                <br/>
                비밀번호<br/>
                <input type="password" name="password" maxlength=16 required/><br/>
                비밀번호 확인<br/>
                <input type="password" name="password_check" maxlength=16 required/><br/>
                이름<br/>
                <input type="text" name="username" maxlength=4 required/><br/>
                휴대폰 번호<br/>
                <input type="text" name="phone_number" maxlength=11 required/>
                <button type="button" onclick="sendCertNumber()">인증번호 받기</button>
                <br/>
                인증번호<br/>
                <input type="text" name="cert_number" maxlength=6 minlength=6 required/>
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
</body>
</html>
