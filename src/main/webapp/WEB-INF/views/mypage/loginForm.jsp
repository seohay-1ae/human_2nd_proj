<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css">
    <c:if test="${messageType eq 'loginFail'}">
        <script>
            window.onload = function () {
                alert("아이디나 비밀번호가 틀립니다. 다시 로그인해주세요");
            }
        </script>
    </c:if>

    <c:if test="${messageType eq 'resetSuccess'}">
        <script>
            window.onload = function () {
                alert("비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요");
            }
        </script>
    </c:if>
</head>

<body>
<nav class="top-nav">
    <div class="back-button">
        <a href="/mypage">← </a>
    </div>
    <div class="title">
        로그인
    </div>
</nav>
<div class="page-container">
    <div class="page-content">
        <div class="login-form-wrapper">

            <form action="${contextPath}/login" method="post" class="login-form">
                <label for="email" style="margin-bottom: 10px;">이메일</label>
                <input type="email" id="user_email" name="user_email"
                       placeholder="이메일을 입력해주세요" required/>

                <label for="password" style="margin-bottom: 10px;">비밀번호</label>
                <input type="password" id="user_password" name="user_password"
                       placeholder="비밀번호를 입력해주세요" required/>

                <div class="find">
                    <a href="/findEmail">이메일 찾기</a>
                    <a href="/findPw">비밀번호 찾기</a>
                </div>

                <button type="submit" class="login-btn" style="margin-top:40px;">로그인 하기</button>
            </form>
        </div>
    </div>
</div>
<%-- 하단 네비게이션 --%>
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
</body>
</html>