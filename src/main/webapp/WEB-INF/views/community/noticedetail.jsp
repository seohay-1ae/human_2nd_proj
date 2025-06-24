<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>공시사항 게시글</title>

    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <style>
        .top-link a:hover {
            color: #1E4CD1;
        }
    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        공지사항
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<!-- 상단 네비게이션 -->
<div class="page-container">
    <div class="page-content">
        <div class="container">

            <%--            <div class="top-link">--%>
            <%--                <a href="${pageContext.request.contextPath}/admin/notice">목록으로</a>--%>
            <%--&lt;%&ndash;                <a href="${pageContext.request.contextPath}/community/notice">공지사항</a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;                <a href="${pageContext.request.contextPath}/community">게시판</a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;                <a href="${pageContext.request.contextPath}/community/registerPlace">명소신청</a>&ndash;%&gt;--%>
            <%--            </div>--%>

            <h2 style="margin: 10px 0;">${notice.title}</h2>
            <p style="margin-bottom: 10px;"><strong>작성일:</strong> <fmt:formatDate value="${notice.regDate}"
                                                                                  pattern="yyyy-MM-dd"/></p>
            <hr/>
            <div style="margin-top: 10px;">
                ${notice.content}
            </div>

        </div>
    </div>
</div>

<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    <!-- js 작성 -->
</script>
</body>
</html>