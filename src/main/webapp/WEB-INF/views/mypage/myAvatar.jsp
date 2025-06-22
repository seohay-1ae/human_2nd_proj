<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setAttribute("pageName", "myavatar");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>내 캐릭터</title>

    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/avatar.css"/>
    <style>
        .my-character {
            display: flex;
            justify-content: center;
            align-items: center;
            justify-items: center;
        }

        .my-character img {
            width: 229px;
            height: 229px;

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
    <!-- 뒤로가기 넣을 때 -->

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        내 아바타
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<!-- 상단 네비게이션 -->

<div class="page-container"> <!-- (필수) -->
    <div class="page-content"> <!-- (필수) -->

        <div class="container">

            <div class="my-character">
                <img src="${pageContext.request.contextPath}/${avatarPaths.HATS_PATH}" alt="모자" class="layer hats"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.TOPS_PATH}" alt="상의" class="layer tops"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.BOTTOMS_PATH}" alt="하의"
                     class="layer bottoms"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.HANDS_PATH}" alt="손" class="layer hands"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.SKINS_PATH}" alt="피부" class="layer skin"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.LINE_PATH}" alt="외곽선" class="layer line"/>
            </div>
        </div>
        <div class="point-box">현재 보유 포인트<br>120p</div>


        <div class="container">
            <div class="tabContainer" id="tabMenu">
                <div class="tab active">모자</div>
                <div class="tab">얼굴</div>
                <div class="tab">상의</div>
                <div class="tab">하의</div>
                <div class="tab">손</div>
                <div class="tab">피부</div>
            </div>

            <div class="item-grid">
                <div class="item-box locked">
                    <img src="${pageContext.request.contextPath}/avatars/hats/01.png" alt="모자1"/></div>
                <div class="item-box locked">
                    <img src="${pageContext.request.contextPath}/avatars/hats/02.png" alt="모자2"/></div>
                <div class="item-box locked">
                    <img src="${pageContext.request.contextPath}/avatars/hats/03.png" alt="모자3"/></div>
                <div class="item-box locked">
                    <img src="${pageContext.request.contextPath}/avatars/hats/04.png" alt="모자4"/></div>
                <div class="item-box locked">
                    <img src="${pageContext.request.contextPath}/avatars/hats/05.png" alt="모자5"/></div>
                <div class="item-box locked">
                    <img src="${pageContext.request.contextPath}/avatars/hats/06.png" alt="모자6"/></div>
            </div>

            <button class="save-button">저장하기</button>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    const tabs = document.querySelectorAll('#tabMenu .tab');
    tabs.forEach((tab, index) => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');
            // TODO: 여기에 탭에 따른 아이템 교체 로직 추가
        });
    });
</script>
</body>
</html>
