<!-- /WEB-INF/views/map/regionDetail.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${region} 지도</title></head>

<!-- 공통 및 페이지별 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

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

    /*.logo {*/
    /*    width: 50%;*/
    /*}*/

    .regionMap {
        width: 80%;
        margin: 10px auto 0 auto;
        padding: 0;
    }

</style>
<body>
<nav class="top-nav">
    <div class="back-button">
        <a href="/">← 전국 지도</a>
    </div>
</nav>
<div class="page-container">
    <div class="page-content">
        <div class="regionMap">
            <object id="svgEmbed" type="image/svg+xml" data="/map/${region}.svg" width="100%" height="800px"></object>
        </div>

    </div>
</div>

<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const embed = document.querySelector("#svgEmbed");
        if (!embed) {
            console.error("SVG object not found!");
            return;
        }

        embed.addEventListener("load", function () {
            const svgDoc = embed.contentDocument || embed.getSVGDocument();
            console.log("svgDoc:", svgDoc);
            if (!svgDoc) {
                console.error("SVG Document is null");
                return;
            }

            const region = "${region}";
            const regions = Array.from(svgDoc.querySelectorAll(".region"));
            console.log("Found regions:", regions.length);
            console.log(regions);
            regions.forEach(el => {
                // console.log("Element outerHTML:", el.outerHTML);
                console.log("id:", el.id);
                console.log("getAttribute('id'):", el.getAttribute("id"));
                el.addEventListener("click", () => {
                    const cityId = el.getAttribute("id")
                    console.log("Clicked cityId:", cityId);
                    window.location.href = "/region/${region}/" + cityId;
                });
            });
        })
    });
</script>
</body>
</html>
