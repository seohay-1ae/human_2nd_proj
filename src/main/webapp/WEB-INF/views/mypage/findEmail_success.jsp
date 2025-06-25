<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>이메일 찾기(완료)</title>
    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/> <!-- (필수) -->
    <style>
        .container {
            margin-top: 20px;
        }

        h2 {
            margin-bottom: 10px;
        }

        p {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">
    <!-- 타이틀 넣을 때 -->
    <div class="title">
        이메일 찾기(완료)
    </div>
    <!-- 타이틀 넣을 때 -->
</nav>
<!-- 상단 네비게이션 -->

<div class="page-container"> <!-- (필수) -->
    <div class="page-content"> <!-- (필수) -->
        <div class="container"> <!-- (양옆으로 마진20 필요할 때) -->
            <h2>가입된 이메일</h2>
            <p>이메일: ${user_email}</p>
            <form action="${pageContext.request.contextPath}/loginSelect" method="get">
                <button type="submit" class="findEmail_check" style="float: right;">확인</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
