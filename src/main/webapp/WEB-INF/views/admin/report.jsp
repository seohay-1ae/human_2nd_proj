<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>신고된 게시물</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        /* ───────────── 공통 레이아웃 */
        .page-content { padding-bottom: 120px; }
        .top-link { margin: 20px 0; }
        .top-link a { font-size: 18px; font-weight: 600; margin-right: 15px; }

        /* ───────────── 카드형 신고 목록 */
        .report-list { margin-top: 20px; }

        .report-card {
            background: #f5f5f5;
            border-radius: 10px;
            padding: 12px 14px;
            margin-bottom: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,.1);

            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            transition: background .15s ease;
        }
        .report-card:hover { background: #ececec; }

        .report-snippet { color: black; font-weight: 600; flex: 1 1 auto; }
        .report-date    { color: #666; font-size: .9rem; white-space: nowrap; }
        .report-count   { font-size: .9rem; color: #d21c1c; white-space: nowrap; }

        /* 삭제 버튼 */
        .report-delete {
            background: #ff4d69; color:#fff;
            border:none; border-radius:6px;
            padding:4px 10px; font-size:.85rem; cursor:pointer;
            transition: background .15s ease; white-space:nowrap;
        }
        .report-delete:hover { background:#e73d57; }

        /* 드롭다운 영역 */
        .filter-bar { display:flex; align-items:center; gap:8px; margin-top:10px; }
        select { padding:4px 6px; }

        /* 모달 */
        #reportModal { display:none; position:fixed; top:0; left:0; width:100vw; height:100vh;
            background:rgba(0,0,0,.5); justify-content:center; align-items:center; z-index:9999; }
        #reportModal .modal-inner { background:#fff; padding:20px; border-radius:10px; width:90%; max-width:420px;
            max-height:80vh; display:flex; flex-direction:column; }
        #reportModalContent { white-space:pre-wrap; line-height:1.4; flex-grow:1; overflow-y:auto; }
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
                <a href="${pageContext.request.contextPath}/admin/adminPage" class="tab-button">사용자 관리</a>
                <a href="${pageContext.request.contextPath}/admin/notice" class="tab-button" style="color:#1E4CD1;">커뮤니티</a>
                <a href="${pageContext.request.contextPath}/admin/adminBadgePage" class="tab-button">뱃지</a>
            </div>

            <!-- 카테고리 선택 -->
            <div class="filter-bar">
                <label for="categorySelect">목록 선택:</label>
                <select id="categorySelect">
                    <option value="notices" ${type eq 'notices' ? 'selected' : ''}>공지사항</option>
                    <option value="reports" ${type eq 'reports' ? 'selected' : ''}>신고된 게시물</option>
                    <option value="registPlace" ${type eq 'registPlace' ? 'selected' : ''}>명소 등록 요청</option>
                </select>
            </div>

            <h2 style="margin:15px 0 10px;">신고된 게시물</h2>

            <!-- 신고 카드 목록 -->
            <div class="report-list">
                <c:forEach var="report" items="${list}">
                    <div class="report-card"
                         onclick="openReportModal({content:'${fn:escapeXml(report.content)}', reportCount:'${report.reportCount}', createdAt:'${fn:substring(report.createdAt, 0, 10)}'})">
                        <span class="report-snippet">
                            <c:choose>
                                <c:when test="${fn:length(report.content) > 10}">
                                    ${fn:substring(report.content, 0, 10)}...
                                </c:when>
                                <c:otherwise>
                                    ${report.content}
                                </c:otherwise>
                            </c:choose>
                        </span>
                        <span class="report-date"><fmt:formatDate value="${report.createdAt}" pattern="yy-MM-dd"/></span>
                        <span class="report-count">🚨 ${report.reportCount}</span>

                        <!-- 삭제 -->
                        <form action="${pageContext.request.contextPath}/admin/notice/deleteReportedPost" method="post"
                              onclick="event.stopPropagation();" style="margin:0;">
                            <input type="hidden" name="postId" value="${report.postId}" />
                            <button type="submit" class="report-delete"
                                    onclick="return confirm('이 게시글과 신고 내역을 모두 삭제하시겠습니까?');">삭제</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- 모달 -->
<div id="reportModal">
    <div class="modal-inner">
        <h3>신고된 게시글 상세</h3>
        <div id="reportModalContent"></div>
        <div style="text-align:right; margin-top:10px;"><button onclick="closeReportModal()">닫기</button></div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const select = document.getElementById('categorySelect');
        select.addEventListener('change', function () {
            const selectedType = this.value;
            console.log("선택된 타입:", selectedType); // 🔥 반드시 보고
            window.location.href = "/admin/notice?type=" + selectedType;
        });
    });

    function openReportModal(data) {
        const modalContent = `
        <p><b>📃 게시글 내용:</b><br><br>\${data.content}</p>
        <p><b>📅 작성일:</b> \${data.createdAt}</p>
        <p><b>🚨 신고수:</b> \${data.reportCount}회</p>
    `;
        document.getElementById("reportModalContent").innerHTML = modalContent;
        document.getElementById("reportModal").style.display = "flex";
    }


    function closeReportModal() {
        document.getElementById("reportModal").style.display = "none";
    }
</script>

</body>
</html>
