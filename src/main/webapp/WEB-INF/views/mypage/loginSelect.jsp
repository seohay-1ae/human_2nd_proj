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
        <link rel = "stylesheet" href = "${contextPath}/css/loginSelect.css">
    </head>

    <body>
        <div class = "login-select-wrapper">
            <div class = "login-select-header">
                <button class = "backButton" onclick = "history.back()"> ← </button>
                <span class = "header-title">로그인</span>
            </div>

            <div class = "basic-character">
                <--<img scr = "기본 아바타 경로" alt = "캐릭터" class = "character-img">-->
            </div>

            <div class = "login-select-buttons">
                <form action = "${contextPath}/mypage/loginForm" method = "get">
                    <button type = "submit" class = "login-button">로그인 하기</button>
                </form>

                <form action = "${contextPath}/mypage/joinForm" method = "get">
                    <button type = "submit" class = "join-button">이메일 가입하기</button>
                </form>
            </div>
        </div>
    </body>
</html>