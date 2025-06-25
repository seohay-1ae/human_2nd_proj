<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>게시판</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
          crossorigin="anonymous"/>

    <style>
        .page-content {
            position: relative;
            padding-bottom: 230px; /* 배너 높이 + 여유 공간 */
        }

        .post-header {
            display: flex;
            align-items: center;
            gap: 7px; /* 작성자와 시간 사이 간격 */
        }

        .banner {
            position: absolute;
            bottom: 55px;
            width: 420px;
            text-align: center;
            z-index: 1000; /* 충분히 큰 값으로 설정 */
        }

        .top-link {
            margin: 20px 0;
        }

        .top-link a {
            font-size: 18px;
            font-weight: 600;
            margin-right: 15px; /* 원하는 간격 설정 */
        }

        .reportBtn {
            background-color: #ff4d69;
            padding: 4px 7px;
            margin-left: auto; /* 오른쪽 끝으로 밀기 */
        }

        .reportBtn:hover {
            background-color: #e73d57;
        }

        .post {
            background-color: #f5f5f5;
            margin-bottom: 10px;
            border-radius: 10px;
            padding: 10px;
        }

        .my-avatar {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid #ccc;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            position: relative;
            margin-right: 15px;
            flex-shrink: 0;
        }

        .my-avatar:hover {
            cursor: pointer;
            border-color: #1E4CD1; /* 파란 테두리 */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25); /* 그림자 효과 */
            transform: translateY(-2px) scale(1.02); /* 살짝 튀어나오는 느낌 */
            transition: all 0.25s ease;
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
    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        게시판
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<!-- 상단 네비게이션 -->

<div class="page-container">
    <div class="page-content">
        <div class="container">

            <div class="top-link">
                <a href="${pageContext.request.contextPath}/community/notice">공지사항</a>
                <a href="${pageContext.request.contextPath}/community" style="color: #1E4CD1">게시판</a>
                <a href="${pageContext.request.contextPath}/community/registerPlace">명소신청</a>
            </div>

            <div class="post-list">
                <c:forEach var="post" items="${posts}">
                    <div class="post">
                        <div class="post-header">
                            <div class="my-avatar"
                                 data-userid="${post.userId}"
                                 data-writer="${post.writer}"
                                 data-hats="${pageContext.request.contextPath}/${post.hatsPath}"
                                 data-tops="${pageContext.request.contextPath}/${post.topsPath}"
                                 data-bottoms="${pageContext.request.contextPath}/${post.bottomsPath}"
                                 data-hands="${pageContext.request.contextPath}/${post.handsPath}"
                                 data-skins="${pageContext.request.contextPath}/${post.skinsPath}"
                                 data-line="${pageContext.request.contextPath}/${post.linePath}">
                                <img src="${pageContext.request.contextPath}/${post.hatsPath}" class="layer hats"/>
                                <img src="${pageContext.request.contextPath}/${post.topsPath}" class="layer tops"/>
                                <img src="${pageContext.request.contextPath}/${post.bottomsPath}"
                                     class="layer bottoms"/>
                                <img src="${pageContext.request.contextPath}/${post.handsPath}" class="layer hands"/>
                                <img src="${pageContext.request.contextPath}/${post.skinsPath}" class="layer skins"/>
                                <img src="${pageContext.request.contextPath}/${post.linePath}" class="layer line"/>
                            </div>

                            <span class="writer" style="color: blue">${post.writer}</span>
                            <span class="time" style="color: black"><fmt:formatDate value="${post.createdAt}"
                                                                                    pattern="yy-MM-dd HH:mm"/></span>
                            <button class="reportBtn" data-postid="${post.postId}">⚠️ 신고</button>
                        </div>
                        <div class="post-content">
                            <p style="font-weight: 600; font-size: 18px !important; margin-bottom: 2px;">${post.content}</p>
                        </div>
                        <div class="post-footer">
                            <!-- ❤️ 좋아요 버튼 -->
                            <span class="likes" data-post-id="${post.postId}">
                              <i class="${post.likedByUser ? 'fa-solid' : 'fa-regular'} fa-heart"
                                 style="color: red;"></i>
                              <span class="like-count" style="color: black;">${post.heartCount}</span>
                            </span>

                            <!-- 💬 댓글 링크 -->
                            <a href="${pageContext.request.contextPath}/community/comment?id=${post.postId}"
                               class="comments-link">
                                💬 ${post.writeCount}
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="write-button">
                <a href="${pageContext.request.contextPath}/community/write">
                    <button type="button" class="write-button" style="float: right;">
                        <i class="fas fa-edit"></i> 글쓰기
                    </button>
                </a>
            </div>
        </div>
    </div>
    <div class="banner">
        <img src="${pageContext.request.contextPath}/banner.png" alt="banner"/>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        const contextPath = "${pageContext.request.contextPath}";

        document.querySelectorAll('.likes').forEach(like => {
            const icon = like.querySelector('i');
            const countSpan = like.querySelector('.like-count');
            const postId = like.dataset.postId;

            like.addEventListener('click', async () => {
                const wasSolid = icon.classList.contains('fa-solid');
                icon.classList.toggle('fa-solid');
                icon.classList.toggle('fa-regular');

                try {
                    const res = await fetch(`${contextPath}/community/heart`, {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify({postId: Number(postId)})  // 🔧 숫자 변환!
                    });

                    if (!res.ok) throw new Error('서버 응답 실패');

                    const json = await res.json();
                    countSpan.textContent = json.heartCount;
                } catch (e) {
                    // 오류 발생 시 아이콘 원복
                    icon.classList.toggle('fa-solid', wasSolid);
                    icon.classList.toggle('fa-regular', !wasSolid);
                    console.error('하트 처리 오류:', e);
                    alert('하트를 처리할 수 없습니다.');
                }
            });
        });
    });

    document.addEventListener("DOMContentLoaded", function () {
        const contextPath = "${pageContext.request.contextPath}";

        document.querySelectorAll(".reportBtn").forEach((btn) => {
            btn.addEventListener("click", async function () {
                const postId = this.dataset.postid;

                const confirmed = confirm("정말 이 게시글을 신고하시겠습니까?");
                if (!confirmed) return;

                try {
                    const res = await fetch(`${contextPath}/community/report`, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({postId})
                    });

                    const result = await res.text();
                    alert(result);
                } catch (e) {
                    alert("신고 중 오류가 발생했습니다.");
                    console.error(e);
                }
            });
        });
    });

    // 모달 닫기 함수
    function closeAvatarModal() {
        document.getElementById("avatarModal").style.display = "none";
    }

    // 모달 열기 및 이미지 설정
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".my-avatar").forEach(avatar => {
            avatar.addEventListener("click", function () {
                const writer = this.dataset.writer;
                document.getElementById("modal-writer").textContent = writer;

                const hats = this.dataset.hats;
                const tops = this.dataset.tops;
                const bottoms = this.dataset.bottoms;
                const hands = this.dataset.hands;
                const skins = this.dataset.skins;
                const line = this.dataset.line;

                document.getElementById("modal-hats").src = hats;
                document.getElementById("modal-tops").src = tops;
                document.getElementById("modal-bottoms").src = bottoms;
                document.getElementById("modal-hands").src = hands;
                document.getElementById("modal-skins").src = skins;
                document.getElementById("modal-line").src = line;

                document.getElementById("avatarModal").style.display = "flex";

                const userId = this.dataset.userid;

                fetch(`${contextPath}/community/userBadges?userId=\${userId}`)
                    .then(res => res.json())
                    .then(data => {
                        const container = document.getElementById("badgeContainer");
                        container.innerHTML = ''; // 초기화

                        if (data.length === 0) {
                            container.innerHTML = '<span style="color: #888;">획득한 뱃지가 없습니다.</span>';
                            return;
                        }

                        data.forEach(badge => {
                            const img = document.createElement("img");
                            img.src = `${contextPath}/badge/\${badge.badgeIconPath}`;
                            img.alt = badge.badgeName;
                            img.title = badge.badgeName;
                            img.style.width = "48px";
                            img.style.height = "48px";
                            img.style.borderRadius = "5px";
                            img.style.filter = badge.userBadgeStatus === '1' ? 'none' : 'grayscale(100%)';
                            container.appendChild(img);
                        });
                    });
            });
        });
    });

</script>
<!-- 아바타 모달 -->
<div id="avatarModal" style="display: none; position: fixed; top: 0; left: 0;
     width: 100vw; height: 100vh; background: rgba(0, 0, 0, 0.6);
     z-index: 9999; justify-content: center; align-items: center;">
    <div style="position: relative; width: 300px; height: 400px; background: white;
     border-radius: 10px; padding: 20px;
     display: flex; flex-direction: column; justify-content: start; align-items: center;">
        <div class="avatar-layers" style="width: 100px; height: 100px; position: relative;">
            <img id="modal-hats" class="layer hats" style="width: 100%; height: 100%; position: absolute;">
            <img id="modal-tops" class="layer tops" style="width: 100%; height: 100%; position: absolute;">
            <img id="modal-bottoms" class="layer bottoms" style="width: 100%; height: 100%; position: absolute;">
            <img id="modal-hands" class="layer hands" style="width: 100%; height: 100%; position: absolute;">
            <img id="modal-skins" class="layer skins" style="width: 100%; height: 100%; position: absolute;">
            <img id="modal-line" class="layer line" style="width: 100%; height: 100%; position: absolute;">
        </div>
        <span id="modal-writer" style=" font-weight: bold;"></span>

        <div id="badgeContainer"
             style="margin-top: 10px; display: flex; gap: 5px; flex-wrap: wrap;"></div>
        <button onclick="closeAvatarModal()"
                style="position: absolute; top: 0px; right: -7px; color: white; background: transparent; border: none; font-size: 18px; cursor: pointer;">
            ❌
        </button>
    </div>
</div>
</body>
</html>
