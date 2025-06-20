<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>로그인</title>
        <link rel = "stylesheet" href = "${contextPath}/css/loginForm.css">
        <c:if test='${not empty message}'>
            <script>
                window.onload=function()
                {
                    result();
                }

                function result(){
                    alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
                }
            </script>
        </c:if>
    </head>

    <body>
        <div class = "login-form-wrapper">
            <div class = "login-form-header">
                <button class = "backButton" onclick = "history.back()"> ← </button>
                <span class = "header-title">로그인</span>
            </div>

            <form action="${contextPath}/mypage/login" method="post" class = "login-form">
                <label for = "email">이메일</label>
                <input type = "email" id = "userId" name = "userId"
                       placeholder = "이메일을 입력해주세요" required />

                <label for = "password">비밀번호</label>
                <input type = "password" id = "userPw" name = "userPw"
                       placeholder = "비밀번호를 입력해주세요" required />

                <div class = "find">
                    <a href="${contextPath}/mypage/findEmail">아이디 찾기</a>
                    <a href="#">비밀번호 찾기</a>
                </div>

                <button type = "submit" class = "login-btn">로그인 하기</button>
            </form>
        </div>
    </body>
</html>