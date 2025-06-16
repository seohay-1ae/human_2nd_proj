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
</head>
<body>
<div class="page-container">

    <div class="page-content">

        <div class="character-header">
            <div class="back-button">←</div>
            내 캐릭터
        </div>

        <div class="character-info">
            <img src="${pageContext.request.contextPath}/avatars/line.png" alt="캐릭터" class="character-image"/>
            <div class="point-box">현재 보유 포인트<br>120p</div>
        </div>


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
