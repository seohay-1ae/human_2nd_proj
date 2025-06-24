<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>신고된 게시물</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <style>
        table {
            width: 100%;
            border-collapse: collapse; /* 테두리 겹침 제거 */
            border: 2px solid #ccc; /* 테이블 전체 테두리 */
        }

        thead th {
            background-color: #b3e9ee;
            border: 1px solid #ccc; /* 셀 테두리 */
            padding: 10px;
            text-align: left;
        }

        tbody td {
            border: 1px solid #ccc; /* 셀 테두리 */
            padding: 10px;
        }

        .table-container {
            margin: 20px 0;
        }
    </style>
</head>
<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <!-- 타이틀 넣을 때 -->
    <div class="title">
        <h2>관리자 페이지</h2>
    </div>
    <!-- 타이틀 넣을 때 -->

</nav>
<!-- 상단 네비게이션 -->

<div class="page-container">
    <div class="page-content">
        <div class="container">

            <div class="top-link">
                <a href="${pageContext.request.contextPath}/admin/adminPage" class="tab-button">사용자 관리</a>
                <a href="${pageContext.request.contextPath}/admin/notice" class="tab-button" style="color: #1E4CD1;">커뮤니티</a>
                <a href="${pageContext.request.contextPath}/admin/adminBadgePage" class="tab-button">뱃지</a>
            </div>

            <div>
                <label for="categorySelect">목록 선택: </label>
                <select id="categorySelect">
                    <option value="notices" ${type eq 'notices' ? 'selected' : ''}>공지사항</option>
                    <option value="reports" ${type eq 'reports' ? 'selected' : ''}>신고된 게시물</option>
                    <option value="registPlace" ${type eq 'registPlace' ? 'selected' : ''}>명소 등록 요청</option>
                </select>
            </div>

            <h2 style="margin-top: 10px;">신고된 게시물</h2>

            <div class="table-container">
                <table border="1" width="100%">
                    <thead>
                    <tr>
                        <th>게시글 내용</th>
                        <th>게시글 작성일</th>
                        <th>신고수</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="report" items="${list}">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${fn:length(report.content) > 10}">
                                        ${fn:substring(report.content, 0, 10)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${report.content}
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>${report.createdAt}</td>
                            <td>${report.reportCount}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/notice/deleteReportedPost"
                                      method="post" style="display:inline;">
                                    <input type="hidden" name="postId" value="${report.postId}"/>
                                    <button type="submit" onclick="return confirm('이 게시글과 신고 내역을 모두 삭제하시겠습니까?');">삭제
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- 하단 nav바 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/> <!-- (필수) -->

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const select = document.getElementById('categorySelect');
        select.addEventListener('change', function () {
            const selectedType = this.value;
            console.log("선택된 타입:", selectedType); // 🔥 반드시 보고
            window.location.href = "/admin/notice?type=" + selectedType;
        });
    });
</script>

</body>
</html>
