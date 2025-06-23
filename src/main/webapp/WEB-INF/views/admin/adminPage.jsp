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
                <a href="${pageContext.request.contextPath}/admin/adminCommunityPage" class="tab-button">커뮤니티</a>
                <a href="${pageContext.request.contextPath}/admin/adminBadgePage" class="tab-button">뱃지</a>
            </div>
            <div class="container">
                <table>
                    <thead>
                        <select name="user_role">
                            <option value="admin">계정</option>
                        </select>

                        <tr>
                            <th>닉네임</th>
                            <th>계정</th>
                            <th></th>
                        </tr>
                    </thead>

                    <tbody>
                    <%-- 예시 데이터. 실제론 서버에서 List<UserVO> userList 전달 --%>
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td>${user.userName}</td>
                                <td>${user.userEmail}</td>
                                <td class="deleteUser">
                                    <div class="dropdown-content">
                                        <form action="${pageContext.request.contextPath}/admin/deleteUser" method="post">
                                            <input type="hidden" name="userId" value="${user.userId}"/>
                                            <button class="more-btn" type="submit" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
