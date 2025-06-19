<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>고객센터</title>

    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/각 페이지에서만 쓰이는 css(만들것).css"/>--%>
    <!-- Font Awesome CDN (최신 버전 및 integrity 없는 버전) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <style>

        .contact-box {
            padding: 20px 0;
        }

        .contact-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }

        .chat-link {
            margin-left: auto;
            color: #007BFF;
            text-decoration: none;
        }

        .chat-link:hover {
            text-decoration: underline;
        }

        .contact-info {
            color: #666;
            font-size: 14px;
            margin-top: 5px;
        }

        .phone-number {
            font-weight: bold;
            font-size: 15px;
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
        고객센터
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<div class="page-container">
    <div class="page-content">
        <%--        양옆으로 마진 20 필요할때--%>
        <div class="container">
            <!-- 채팅 문의 영역 -->
            <div class="contact-box">
                <div class="contact-title">
                    <i class="fa-regular fa-comment-dots"></i> &nbsp;채팅 문의
                    <!-- a 태그로 채팅 링크 -->
                    <a href="#" class="chat-link">1:1 채팅하기</a>
                </div>
                <!-- 상담 가능 시간 안내 -->
                <p class="contact-info">실시간 문의 상담 가능 시간은 아래와 같습니다<br>
                    평일 오전 09:00 - 오후 05:30 (상시 상담 가능)
                </p>
            </div>
        </div>

        <hr style="border: 0.8px solid #ccc;"/>

        <div class="container">
            <!-- 전화 문의 영역 -->
            <div class="contact-box">
                <div class="contact-title">
                    <i class="fa-solid fa-headphones"></i>&nbsp;
                    전화 문의
                </div>
                <!-- 전화번호는 p 태그로 구성 -->
                <p class="phone-number">010 - 1234 - 5678</p>
                <!-- 전화 운영 시간 안내 -->
                <p class="contact-info">
                    평일 오전 09:00 - 오후 05:30 (주말 및 공휴일 제외)<br>
                    점심시간 (오후 12:50 - 오후 1:40)
                </p>
            </div>
        </div>
    </div>
</div>

<!-- 하단 nav바 필수 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    <!-- js 작성 -->
</script>
</body>
</html>