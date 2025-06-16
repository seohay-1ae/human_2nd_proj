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
        <link rel = "stylesheet" href = "${contextPath}/resources/static/css/emailLogin.css">
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
        <div class = "login-box">
            <h2>로그인</h2>
	        <form action="${contextPath}/mypage/emailLogin" method="post">
	            <label for = "email">이메일</label>
	            <input type = "email" id = "email" name = "email"
	                   placeholder = "이메일을 입력해주세요" required />

                <label for = "password">비밀번호</label>
                <input type = "password" id = "password" name = "password"
                       placeholder = "비밀번호를 입력해주세요" required />

                <div class = "find">
                    <a href="#">아이디 찾기</a>
                    <a href="#">비밀번호 찾기</a>
                </div>

                <button type = "submit">로그인 하기</button>
            </div>
        </form>
    </body>
</html>