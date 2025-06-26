<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>관리자 – 사용자 관리</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        /* ───────────── 공통 레이아웃 */
        .page-content { padding-bottom: 120px; }
        .top-link { margin: 20px 0; }
        .top-link a { font-size: 18px; font-weight: 600; margin-right: 15px; }

        /* ───────────── 카드형 사용자 목록 */
        .user-list { margin-top: 20px; }

        .user-card {
            background: #f5f5f5;
            border-radius: 10px;
            padding: 12px 14px;
            margin-bottom: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,.1);

            display: flex;
            align-items: center;
            gap: 10px;
            transition: background .15s ease;
        }

        .user-nick   { color:black; font-weight:600; flex: 0 0 50px; }
        .user-email  { color:#333;    flex:1 1 auto; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }

        /* 삭제 버튼 */
        .user-delete {
            background:#ff4d69; color:#fff;
            border:none; border-radius:6px;
            padding:4px 10px; font-size:.85rem; cursor:pointer;
            transition: background .15s ease; white-space:nowrap;
        }
        .user-delete:hover { background:#e73d57; }
    </style>
</head>
<body>
<nav class="top-nav">
    <div class="title">관리자 페이지</div>
    <div class="logout-nav"><button onclick="window.location.href='/logout'">로그아웃</button></div>
</nav>

<div class="page-container">
    <div class="page-content">
        <div class="container">
            <!-- 탭 링크 -->
            <div class="top-link">
                <a href="${pageContext.request.contextPath}/admin/adminPage" class="tab-button" style="color:#1E4CD1;">사용자 관리</a>
                <a href="${pageContext.request.contextPath}/admin/notice" class="tab-button">커뮤니티</a>
<%--                <a href="${pageContext.request.contextPath}/admin/adminBadgePage" class="tab-button">뱃지</a>--%>
            </div>

            <!-- 사용자 카드 목록 -->
            <div class="user-list">
                <c:forEach var="user" items="${userList}">
                    <div class="user-card">
                        <span class="user-nick">${user.userName}</span>
                        <span class="user-email">${user.userEmail}</span>

                        <form action="${pageContext.request.contextPath}/admin/deleteUser" method="post" style="margin:0;">
                            <input type="hidden" name="userId" value="${user.userId}" />
                            <button type="submit" class="user-delete"
                                    onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
</body>
</html>