<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>main</title>

    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/각 페이지에서만 쓰이는 css(만들것).css"/>--%>
    <style>
        .top-nav {
            position: fixed;
            top: 0;
            width: 100%;
            height: 60px;
            background: #fff;
            border-bottom: 1px solid #ccc;
            display: flex;
            justify-content: space-around;
            align-items: center;
            z-index: 999;
        }

        .logo {
            width: 50%;
        }

        .koreaMap {
            width: 80%;
            margin: 10px auto 0 auto;
            padding: 0;
        }

    </style>
</head>

<body>

<nav class="top-nav">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/logo.png" alt="logo"/>
    </div>
</nav>
<div class="page-container">
    <div class="page-content">

        <div class="koreaMap">
            <object id="koreaMap" type="image/svg+xml" data="/map/koreaMap.svg"></object>
        </div>

    </div>
</div>

<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.getElementById("koreaMap").addEventListener("load", function () {
        const svgDoc = this.contentDocument;

        // 원하는 지역 ID들
        ["busan","chungbuk","chungnam","daegu","daejeon","gangwon","gwangju","gyeongbuk","gyeonggi","gyeongnam",
        "incheon","jeju","jeonbuk","jeonnam","sejong","seoul","ulsan"].forEach(regionId => {
            const regionEl = svgDoc.getElementById(regionId);
            if (regionEl) {
                regionEl.style.cursor = "pointer";
                regionEl.style.transition = "fill 0.2s ease";
                regionEl.style.fill = "#AFD88C"; // 기본 색

                // 클릭 시 이동
                regionEl.addEventListener("click", () => {
                    window.location.href = "/region/" + regionId;
                });

                // 마우스 호버 효과
                regionEl.addEventListener("mouseenter", () => {
                    regionEl.style.fill = "#84CD49"; // hover 색
                });

                regionEl.addEventListener("mouseleave", () => {
                    regionEl.style.fill = "#AFD88C"; // 원래 색
                });
            }
        });

    });
</script>

</body>
</html>