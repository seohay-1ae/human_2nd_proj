<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.project.travelquest.map.model.Location" %>

<style>
    .place-detail-container {
        padding: 1rem;
        max-width: 600px;
        margin: 0 auto;
    }

    .place-detail-container img {
        max-width: 100%;
        border-radius: 6px;
    }

    .tabs {
        display: flex;
        margin-top: 1rem;
    }

    .tabs button {
        flex: 1;
        padding: 0.7rem;
        background: #f0f0f0;
        border: none;
        cursor: pointer;
        color:black;
    }

    .tabs button.active {
        background: #ddd;
        font-weight: bold;
    }

    .tab-content {
        margin-top: 1rem;
        display: none;
    }

    .tab-content.active {
        display: block;
    }

    .review-form textarea {
        width: 100%;
        height: 80px;
        margin-bottom: 0.5rem;
    }

    .review-item {
        padding: 0.5rem;
        border-bottom: 1px solid #eee;
    }
</style>

<%
    com.project.travelquest.map.model.Location locationObj =
            (com.project.travelquest.map.model.Location) request.getAttribute("location");
    String formattedOverview = "";
    if(locationObj != null && locationObj.getOverview() != null){
        formattedOverview = locationObj.getOverview().replaceAll("\\.\\s*", ".<br/>");
    }
%>

<div class="place-detail-container">
    <h2>${location.title}</h2>
    <p>${location.addr1}</p>
    <br/>
    <img src="${location.firstimage}" alt="${location.title}"/>

    <div class="tabs">
        <button class="tab-btn active" data-tab="info">정보</button>
        <button class="tab-btn" data-tab="review">리뷰</button>
        <button class="tab-btn" data-tab="overview">상세</button>
    </div>

    <div id="tab-info" class="tab-content active">
        <div class="content-map" style="width: 100%; height: 200px; margin-top: 1rem;"></div>
        <br/>

        <div class="content-badge">
            <p>이 장소를 방문 시 획득 가능한 뱃지</p>
            <c:if test="${not empty location.badgeImgPath}">
                <img src="${pageContext.request.contextPath}/badge/${location.badgeImgPath}" alt="뱃지 아이콘"
                     style="width: 100px; height: auto;">
            </c:if>
        </div>
    </div>

    <div id="tab-review" class="tab-content">
        <form id="reviewForm" class="review-form" style="margin-bottom:30px;">
            <textarea name="content" placeholder="리뷰를 작성해주세요"></textarea>
            <button type="submit" style="float: right;">리뷰 등록</button>
        </form>
        <br/>
        <div id="reviewList">
            <!-- 리뷰 목록이 여기에 표시됩니다 -->
        </div>
    </div>

    <div id="tab-overview" class="tab-content">
        <% if(locationObj != null) { %>

        <% if(locationObj.getOverview() != null && !locationObj.getOverview().isEmpty()) { %>
        <p><%= locationObj.getOverview().replaceAll("\\.", ".<br/>") %></p>
        <% } %>
        <% } else { %>
        <p>locationObj is null</p>
        <% } %>
        <br/>

        <c:if test="${not empty homepageUrl}">
            <p><strong>홈페이지:</strong>
                <a href="${homepageUrl}" target="_blank">${homepageUrl}</a><br/>
            </p>
            <br/>
        </c:if>

        <c:if test="${not empty location.infocenter}">
            <p><strong>문의처:</strong> ${location.infocenter}</p><br/>
        </c:if>

        <c:if test="${not empty location.usetime}">
            <p><strong>운영시간:</strong> ${location.usetime}</p><br/>
        </c:if>

        <c:if test="${not empty location.restdate}">
            <p><strong>휴무일:</strong> ${location.restdate}</p><br/>
        </c:if>

        <c:if test="${not empty location.usefee}">
            <p><strong>이용요금:</strong> ${location.usefee}</p>
        </c:if>
    </div>
</div>

<!-- JS 파일 로딩 -->
<script src="${pageContext.request.contextPath}/js/placeDetail.js"></script>
<script>
    // JSP에서 location 객체에 contentId가 있다고 가정
    const contentId = ${location.contentid != null ? location.contentid : 0};
    // 페이지 로드 후 initPlaceModal 호출
    window.addEventListener('DOMContentLoaded', () => {
        initPlaceModal(contentId);
    });
</script>
