<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>뱃지 상세</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <style>
        .badge-detail-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 20px;
        }

        .badge-image {
            width: 160px;
            height: auto;
            margin-bottom: 20px;
        }

        .badge-info-box {
            width: 100%;
            max-width: 400px;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            background-color: #fff;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        }

        .badge-info-box h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .badge-info-box p {
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>

<!-- 상단 네비게이션 -->
<nav class="top-nav">
</nav>

<div class="page-container">
    <div class="page-content">
        <div class="badge-detail-container">

            <!-- 뱃지 이미지 -->
            <img src="${pageContext.request.contextPath}/badge/${badge.badgeIconPath}"
                 alt="뱃지 이미지"
                 class="badge-image"
                 style="${badge.userBadgeStatus != '1' ? 'filter: grayscale(100%); opacity: 0.7;' : ''}"/>

            <!-- 설명 박스 -->
            <div class="badge-info-box">
                <h2>${badge.userBadgeStatus == '1' ? badge.badgeName : '????'}</h2>
                <p>${badge.userBadgeStatus == '1' ? badge.badgeContent : '아직 개방되지 않은 뱃지입니다.'}</p>
            </div>

        </div>
    </div>
</div>

</body>
</html>