<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html >
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>비밀번호 찾기</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
        <link rel="stylesheet" href="${contextPath}/css/findPwForm.css">
    </head>

    <body>
        <nav class="top-nav">
            <div class="back-button">
                <a href="/mypage">← </a>
            </div>
            <div class="title">
                비밀번호 찾기
            </div>
        </nav>
        <div class="page-container">
            <div class="page-content">
                <div class="findPw-form-wrapper">

                    <label for="email">이메일</label>
                    <input type="email" id="email" placeholder="이메일 입력"/>
                    <button type="button" onclick="sendCode()">인증번호 받기</button>

                    <label for="verifyCode">인증번호</label>
                    <input type="text" id="verifyCode" placeholder="인증번호 입력"/>
                    <button type="button" onclick="verifyCode()">인증 확인</button>

                    <!-- 인증 성공 시 나타나는 영역 -->
                    <div id="resetPwSection" style="display: none;">
                        <form id="resetPwForm" method="post" action="${contextPath}/resetPw">
                            <!-- 인증된 이메일-->
                            <input type="hidden" name="user_email" id="verifyEmail" />

                            <label>새 비밀번호</label>
                            <input type="password" id="newPw" name="user_password" required />

                            <label>비밀번호 확인</label>
                            <input type="password" id="confirmPw" required />

                            <button type="submit" class="next-btn">다음</button>
                        </form>
                    </div>


                </div>
            </div>
        </div>
        <%-- 하단 네비게이션 --%>
        <jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

        <%-- 외부 Js --%>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="/js/findPwForm.js"></script>
    </body>
</html>