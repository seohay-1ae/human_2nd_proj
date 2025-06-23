<%--
    Created by IntelliJ IDEA.
    User: usbtt
    Date: 25. 6. 11.
    Time: 오후 3:35
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>관리자 페이지</title>
        <!-- 공통 및 페이지별 CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/> <!-- (필수) -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
</head>
<body>
    <!-- 상단 네비게이션 -->
    <nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        <h2>관리자 페이지</h2>
    </div>
    <!-- 타이틀 넣을 때 -->

    <div class="top-menu">
        <a href="/logout">로그아웃</a>
    </div>

    </nav>
    <!-- 상단 네비게이션 -->

    <div class="page-container">
        <div class="page-content">
            <div class="tab-menu">
                <a href="${pageContext.request.contextPath}/admin/adminPage" class="tab-button">사용자 관리</a>
                <a href="${pageContext.request.contextPath}/admin/adminTravelPage" class="tab-button">여행지역</a>
                <a href="${pageContext.request.contextPath}/admin/communityPage" class="tab-button">커뮤니티</a>
                <a href="${pageContext.request.contextPath}/admin/badgePage" class="tab-button">뱃지</a>
            </div>
            <div class="container">
                <table>
                    <thead>
                        <select name="user_role">
                            <option value="admin">공지사항 관리</option>
                            <option value="admin">나만의 명소 검토</option>
                        </select>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
