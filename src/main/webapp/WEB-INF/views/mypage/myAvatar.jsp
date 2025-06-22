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

        .avatar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            height: 250px;
            background-color: #fff;
        }

        .my-character {
            position: relative;
            width: 229px;
            height: 229px;
        }

        .my-character img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
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

        <div class="avatar-container">

            <div class="my-character">
                <img src="${pageContext.request.contextPath}/${avatarPaths.HATS_PATH}" alt="모자" class="layer hats"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.TOPS_PATH}" alt="상의" class="layer tops"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.BOTTOMS_PATH}" alt="하의"
                     class="layer bottoms"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.HANDS_PATH}" alt="손" class="layer hands"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.SKINS_PATH}" alt="피부" class="layer skins"/>
                <img src="${pageContext.request.contextPath}/${avatarPaths.LINE_PATH}" alt="외곽선" class="layer line"/>
            </div>
        </div>
        <div class="point-box">현재 보유 포인트<br>120p</div>


        <div class="container">
            <div class="tabContainer" id="tabMenu">
                <div id="hats" class="tab active">모자</div>
                <div id="tops" class="tab">상의</div>
                <div id="bottoms" class="tab">하의</div>
                <div id="hands" class="tab">손</div>
                <div id="skins" class="tab">피부</div>
            </div>

            <div class="item-grid">
            </div>
            <button class="buy-button">구입하기</button>
            <button class="save-button">저장하기</button>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    const tabs = document.querySelectorAll('#tabMenu .tab');
    const itemGrid = document.querySelector('.item-grid');

    function loadItem(type) {

        fetch(`/avatar/items?avatar_item_type=\${type}`)
            .then(response => response.json())
            .then(items => {
                console.log("받아온 아이템 목록:", items);
                itemGrid.innerHTML = '';

                if (!Array.isArray(items)) {
                    console.error("items가 배열이 아님:", items);
                    return;
                }
                console.log("0");
                items.forEach(item => {
                    const div = document.createElement('div');
                    console.log("1");
                    div.classList.add('item-box');
                    if (item.locked) div.classList.add('locked');
                    console.log("2");
                    const img = document.createElement('img');
                    img.src = item.itemPath;
                    img.alt = item.itemType;
                    img.id = item.itemId;
                    console.log("3");
                    div.appendChild(img);
                    itemGrid.appendChild(div);

                });
            })
            .catch(error => {
                console.error('아이템 로딩 실패:', error);
            });
    }

    tabs.forEach((tab, index) => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');

            const category = tab.id;
            // TODO: 여기에 탭에 따른 아이템 교체 로직 추가
            loadItem(category);

        });
    });

    itemGrid.addEventListener('click', (e) => {
        const target = e.target.closest('.item-box');
        if (!target) return; // .item-box가 아닌 다른 곳 클릭 시 무시

        const activeTabId = document.querySelector(".tab.active").id; // 예: "hats"
        const layerImg = document.querySelector(`.my-character .\${activeTabId}`);

        const imgTag = target.querySelector("img");
        const newSrc = imgTag.getAttribute("src");
        const newId = imgTag.getAttribute("id");

        if (layerImg) {
            layerImg.setAttribute("src", newSrc);
            layerImg.setAttribute("id", newId);

        }

        console.log(`changed \${activeTabId} to \${newSrc}`);
        console.log(`changed id to \${newId}`);
    });


    document.querySelector(".save-button").addEventListener('click', () => {
        const avatarData = {
            hats: document.querySelector(".my-character .hats").id,
            tops: document.querySelector(".my-character .tops").id,
            bottoms: document.querySelector(".my-character .bottoms").id,
            hands: document.querySelector(".my-character .hands").id,
            skins: document.querySelector(".my-character .skins").id
        };

        fetch('/avatar/save', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(avatarData)
        })
        .then(res => {
            if (res.ok) {
                alert('아바타 저장 완료!');
            } else {
                alert('저장 실패!');
            }
        })
        .catch(err => {
            console.error('저장 중 오류 발생:', err);
            alert('저장 중 오류가 발생했습니다.');
        });
    });

    window.addEventListener('DOMContentLoaded', () => {
        loadItem('hats');
    });

</script>
</body>
</html>
