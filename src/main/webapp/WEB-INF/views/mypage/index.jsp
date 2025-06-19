<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!--아이콘 cnd 연결-->
    <style>
        .profile_button {
            font-size: 10px;
            padding: 0.3rem 0.5rem;
            background-color: lightgrey;
            color: black;
            margin-right: 3px;

        }
    </style>
</head>
<body>
<nav class="top-nav">
    <div class="title">
        마이페이지
    </div>
</nav>
<div class="page-container">
    <div class="page-content">
        <%-- 이 화면 로딩하는데 필요한 파일 mypageController , UserVO <- 이 놈은 없으면 로그아웃 상태
            또 a 태그에 경로 제대로 표시 해주고 컨트롤러에 맵핑 해주기(아직안함)-->
        <%-- 로그인 상태에 따라 분기 --%>
        <c:choose>

            <%--로그인 상태일 때 --%> <%--로그인 상태 원할시 http://localhost:18090/loginDummy 로 요청--%>
            <c:when test="${not empty sessionScope.loginUser}">
                <div class="container">
                        <%-- 프로필 영역 --%>
                    <div class="profile-section"
                         style=" display: flex; align-items: center; justify-content: space-between; padding:20px 0;">
                        <div style="display: flex; align-items: center;">
                            <img src="/avatars/line.png" alt="프로필"
                                 style="width: 60px; height: 60px; border-radius: 50%; margin-right: 15px;">
                            <div>
                                <div style="font-weight: bold; font-size: 16px;">
                                        ${loginUser.user_name}
                                </div>
                                <div style="font-size: 14px; color: gray;">
                                        ${loginUser.user_email}
                                </div>
                            </div>
                        </div>

                        <div>
                            <button class="profile_button">프로필 편집</button>
                            <button class="profile_button" onclick="location.href='/logout'">로그아웃</button>

                            <i class="bi bi-gear-fill"></i>
                        </div>
                    </div>
                </div>
                <hr style="border: 0.8px solid #ccc;"/>

                <div class="container">
                        <%-- 아이콘 메뉴 --%>
                    <ul class="menu-list"
                        style="display: flex; justify-content: space-around; text-align: center; padding:40px 0;">
                        <li>
                            <i class="fa-regular fa-bookmark" style="font-size: 24px; margin-bottom: 5px;"></i>
                            <div>관심지역</div>
                        </li>
                        <li>
                            <i class="fa-regular fa-user" style="font-size: 24px; margin-bottom: 5px;"></i>
                            <div>내 캐릭터</div>
                        </li>
                        <li>
                            <i class="fa-regular fa-pen-to-square" style="font-size: 24px; margin-bottom: 5px;"></i>
                            <div>내가 쓴 글</div>
                        </li>
                        <li>
                            <i class="fa-regular fa-heart" style="font-size: 24px; margin-bottom: 5px;"></i>
                            <div>관심 글</div>
                        </li>
                    </ul>
                </div>
                <hr style="border: 0.8px solid #ccc;"/>

            <div class="container">
                <%-- 문의 및 알림 --%>
                <div style="padding-top: 30px;">
                    <h3 style="margin-bottom: 10px;">문의 및 알림</h3>
                    <ul style="line-height: 2;">
                        <li><a href="/customerCenter">고객 센터</a></li>
                        <li><a href="/termsAndPrivacy">약관 및 정책</a></li>
                    </ul>
                </div>
            </div>
            </c:when>

            <%-- ❗ 비회원 상태일 때 --%>
            <c:otherwise>
                <script>
                    location.href = '${pageContext.request.contextPath}/loginSelect';
                </script>
            </c:otherwise>

        </c:choose>
    </div>
</div>

<%-- 하단 네비게이션 --%>
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
</body>
</html>
