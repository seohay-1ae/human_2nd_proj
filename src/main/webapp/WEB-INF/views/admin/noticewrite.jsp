<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>공지사항 작성</title>


    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        .title-label {
            margin: 10px 0;
            font-size: 20px; /* 원하는 텍스트 크기 설정 */
            font-weight: 600;
        }

        .content-label {
            margin: 10px 0;
            font-size: 20px; /* 원하는 텍스트 크기 설정 */
            font-weight: 600;
        }

        textarea {
            width: 380px;
            height: 300px;
            margin-bottom: 10px;
            resize: none;
            overflow: auto;
            padding: 10px;
            font-size: 17px; /* 원하는 텍스트 크기 설정 */
            font-weight: 600;
        }
        .container{
            margin-top: 20px;
        }
    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        공지사항 작성
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<!-- 상단 네비게이션 -->
<div class="page-container">
    <div class="page-content">
        <div class="container">

            <form action="${pageContext.request.contextPath}/admin/notice/write" method="post">
                <label for="title" class="title-label">제목</label><br>
                <input type="text" id="title" name="title" required><br><br>

                <label for="content" class="content-label">내용</label><br>
                <textarea id="content" name="content" rows="10" cols="50" required></textarea><br><br>

                <button type="submit" style="float: right">등록</button>
            </form>

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