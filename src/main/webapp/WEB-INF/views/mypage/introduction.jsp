<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>소개글 설정</title>
    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/> <!-- (필수) -->
    <style>
        .container {
            display: flex;
            flex-direction: column; /* 세로 정렬 */
            align-items: center; /* 가로 가운데 정렬 */
            justify-content: center; /* 세로 가운데 정렬 */
            margin: 20px auto; /* 위아래 20px, 좌우 자동 */
            gap: 15px; /* 요소들 간 간격 */
            box-sizing: border-box;
        }

        .my-avatar {
            width: 200px;
            height: 200px;
            margin-bottom: 20px;
            border-radius: 50%;       /* 원형 모양 */
            overflow: hidden;         /* 내부 이미지가 원 밖으로 나가지 않도록 */
            border: 3px solid #ccc;   /* 테두리 */
            box-shadow: 0 0 8px rgba(0,0,0,0.15); /* optional 그림자 */
            position: relative;       /* 내부 절대위치 요소 기준 */
        }
        .my-avatar img.layer {
            position: absolute;
            top: 6px;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;        /* 이미지가 비율 유지하며 영역 채우기 */
            /* border-radius: 0; 이미지 자체는 둥글게 하지 않음 */
        }

        /* label과 textarea를 세로로 쌓기 */
        form label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        textarea.profileText {
            width: 370px; /* 가로 고정 */
            resize: vertical; /* 세로만 조절 가능 */
            min-height: 120px;
            max-height: 300px;
            padding: 8px;
            font-size: 14px;
            box-sizing: border-box;
            background-color: #f5f5f5;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-family: inherit;
        }

        /* 버튼 중앙 정렬 */
        form button {
            margin-top: 10px;
            padding: 8px 16px;
            cursor: pointer;
        }

        .avatar {
            position: relative;
            width: 200px;
            height: 200px;
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
    </style>
</head>
<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 뒤로가기 넣을 때 -->
    <div class="back-button">
        <a href="/mypage">← </a>
    </div>

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        소개글 설정
    </div>

</nav>
<!-- 상단 네비게이션 -->

<div class="page-container"> <!-- (필수) -->
    <div class="page-content"> <!-- (필수) -->
        <div class="container"> <!-- (양옆으로 마진20 필요할 때) -->
            <div class="my-avatar">
                <img src="${pageContext.request.contextPath}/${avatarPaths.HATS_PATH}" alt="모자" class="layer hats"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.TOPS_PATH}" alt="상의" class="layer tops"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.BOTTOMS_PATH}" alt="하의"
                     class="layer bottoms"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.HANDS_PATH}" alt="손" class="layer hands"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.SKINS_PATH}" alt="피부" class="layer skins"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.LINE_PATH}" alt="외곽선" class="layer line"/>
            </div>
            <form action="${pageContext.request.contextPath}/introduction" method="post">
                <label>소개글</label>
                <textarea class="profileText" name="profileText" rows="6" cols="50" placeholder="자기소개"><c:out
                        value="${loginUser.user_profile_text}"/></textarea>
                <br/>
                <button type="submit">저장하기</button>
            </form>
            <br/>
            <c:if test="${not empty message}">
                <p style="color: green;">${message}</p>
            </c:if>
        </div>
    </div>
</div>
<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/> <!-- (필수) -->
</body>
</html>
