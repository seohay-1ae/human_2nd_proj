<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html >
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>사용자 목록</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
        <link rel="stylesheet" href="${contextPath}/css/#.css">
    </head>

    <body>
        <nav class="top-nav">
            <div class="back-button">
                <a href="/mypage">← </a>
            </div>
            <div class="title">
                사용자 목록
            </div>
        </nav>
        <div class="page-container">
            <div class="page-content">
                <table>
                    <thead>
                        <tr>
                            <th>닉네임</th>
                            <th>이메일</th>
                            <th>권한</th>
                            <th>상태</th>
                            <th>관리</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td>${user.user_name}</td>
                                <td>${user.user_email}</td>
                                <td>${user.user_role}</td>
                                <td>${user.user_status}</td>
                                <td class="options">...</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%-- 하단 네비게이션 --%>
        <jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>
    </body>
</html>