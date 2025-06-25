<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<title>이메일 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
<style>
    .container {
        margin-top: 20px;
    }
    input{
        padding:5px;
        margin-bottom: 10px;
    }

</style>
</head>
<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        <h2>이메일 찾기</h2>
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<!-- 상단 네비게이션 -->
<div class="page-container"> <!-- (필수) -->
    <div class="page-content"> <!-- (필수) -->
        <div class="container"> <!-- (양옆으로 마진20 필요할 때) -->
            <!-- html작성 -->
            <form name="findEmailForm" action="/findEmail" method="post" onsubmit="return validateForm()">
                <label for="user_name">이름</label><br/>
                <input type="text" id="user_name" name="user_name" maxlength=4 required/><br/>

                <label for="phone_number">휴대폰 번호</label><br/>
                <input type="text" placeholder=" - 없이 입력해주세요." id="phone_number" name="phone_number" maxlength=11 required/>
                <button type="button" onclick="sendCertNumber()">인증번호 받기</button>
                <br/>

                <label for="cert_number">인증번호</label><br/>
                <input type="text" id="cert_number" name="cert_number" maxlength=6 minlength=6 required/>
                <button type="button" onclick="verifyCertNumber()" required>인증번호 확인</button>
                <br/>
                <br/>
                <button type="submit" value="다음" style="float:right;">다음</button>
            </form>
        </div>
    </div>
</div>
<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/> <!-- (필수) -->
<script src="/js/findEmail.js"></script>
</body>
</html>
