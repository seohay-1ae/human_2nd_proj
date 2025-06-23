<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .profile_button {
            font-size: 12px;
            padding: 6px 10px;
            background-color: lightgrey;
            color: black;
            margin-left: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .menu-list li {
            cursor: pointer;
        }

        .my-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid #ccc;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            position: relative;
            margin-right: 15px;
            flex-shrink: 0;
        }

        .my-avatar img.layer {
            position: absolute;
            top: 4px;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .layer {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
        }

        .hands {
            z-index: 10;
        }

        .skins {
            z-index: 20;
        }

        .line {
            z-index: 30;
        }

        .bottoms {
            z-index: 40;
        }

        .tops {
            z-index: 50;
        }

        .hats {
            z-index: 70;
        }

        .profile-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
        }

        .profile-info {
            display: flex;
            align-items: center;
        }

        .user-text {
            display: flex;
            flex-direction: column;
        }

        .user-text .name {
            font-weight: bold;
            font-size: 16px;
        }

        .user-text .email {
            font-size: 14px;
            color: gray;
        }

        .menu-list {
            display: flex;
            justify-content: space-around;
            text-align: center;
            margin: 10px 0;
        }

        .menu-list li i {
            font-size: 24px;
            margin-bottom: 5px;
        }

        .section {
            padding: 30px 20px;
        }

        hr {
            border: 0.8px solid #ccc;
            margin: 0;
        }
    </style>
</head>
<body>
<nav class="top-nav">
    <div class="title">마이페이지</div>
</nav>

<div class="page-container">
    <div class="page-content">
        <c:choose>

            <c:when test="${not empty sessionScope.loginUser}">

                <div class="profile-section">
                    <div class="profile-info">
                        <div class="my-avatar">
                            <img src="${pageContext.request.contextPath}/${avatarPaths.HATS_PATH}" alt="모자"
                                 class="layer hats"/>
                            <img src="${pageContext.request.contextPath}/${avatarPaths.TOPS_PATH}" alt="상의"
                                 class="layer tops"/>
                            <img src="${pageContext.request.contextPath}/${avatarPaths.BOTTOMS_PATH}" alt="하의"
                                 class="layer bottoms"/>
                            <img src="${pageContext.request.contextPath}/${avatarPaths.HANDS_PATH}" alt="손"
                                 class="layer hands"/>
                            <img src="${pageContext.request.contextPath}/${avatarPaths.SKINS_PATH}" alt="피부"
                                 class="layer skins"/>
                            <img src="${pageContext.request.contextPath}/${avatarPaths.LINE_PATH}" alt="외곽선"
                                 class="layer line"/>
                        </div>
                        <div class="user-text">
                            <span class="name">${loginUser.user_name}</span>
                            <span class="email">${loginUser.user_email}</span>
                        </div>
                    </div>
                    <div>
                        <button class="profile_button" onclick="location.href='/introduction'">소개글 설정</button>
                        <button class="profile_button" onclick="location.href='/logout'">로그아웃</button>
                    </div>
                </div>

                <hr/>


                <div class="section">
                    <ul class="menu-list">
                        <li onclick="location.href='/myavatar'">
                            <i class="fa-regular fa-user"></i>
                            <div>내 아바타</div>
                        </li>
                        <li onclick="location.href='/myPost'">
                            <i class="fa-regular fa-pen-to-square"></i>
                            <div>내가 쓴 글</div>
                        </li>
                        <li onclick="location.href='/likedPost'">
                            <i class="fa-regular fa-heart"></i>
                            <div>관심 글</div>
                        </li>
                    </ul>
                </div>

                <hr/>


                <div class="section">
                    <h3 style="margin-bottom: 10px;">문의 및 알림</h3>
                    <ul style="line-height: 2;">
                        <li><a href="/customerCenter">고객 센터</a></li>
                        <li><a href="/termsAndPrivacy">약관 및 정책</a></li>
                    </ul>
                </div>
            </c:when>

            <c:otherwise>
                <script>
                    location.href = '${pageContext.request.contextPath}/loginSelect';
                </script>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
</body>
</html>
