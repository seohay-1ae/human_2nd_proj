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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginSelect.css">
</head>

<body>
<nav class="top-nav">
    <div class="title">
        로그인
    </div>
</nav>
<div class="page-container">
    <div class="page-content">
        <div class="login-select-wrapper">
            <div class="basic-character">
                <img src="/avatars/line.png" alt="프로필"
                     style="width: 60px; height: 60px; border-radius: 50%; margin-right: 15px;">
            </div>

            <div class="login-select-buttons">
                <form action="${contextPath}/login" method="get">
                    <button type="submit" class="login-button">로그인 하기</button>
                </form>

                <form action="${contextPath}/joinForm" method="get">
                    <button type="submit" class="join-button">이메일 가입하기</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%-- 하단 네비게이션 --%>
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
</body>
</html>