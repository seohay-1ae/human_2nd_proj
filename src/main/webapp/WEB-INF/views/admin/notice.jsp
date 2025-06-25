<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>관리자 – 공지사항</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        /* ───────────── 공통 레이아웃 */
        .page-content { padding-bottom: 120px; }
        .top-link { margin: 20px 0; }
        .top-link a { font-size: 18px; font-weight: 600; margin-right: 15px; }

        /* ───────────── 카드형 공지 목록 */
        .notice-list { margin-top: 20px; }

        .notice-card {
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
        .notice-card:hover { background: #ececec; }

        .notice-title { color: black; font-weight: 600; flex: 1 1 auto; }
        .notice-date  { color: #666; font-size: .9rem; white-space: nowrap; }

        /* 삭제 버튼 – 카드 내부에서도 분명히 보이도록 */
        .notice-delete {
            background: #ff4d69;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 4px 10px;
            font-size: .85rem;
            cursor: pointer;
            transition: background .15s ease;
            white-space: nowrap;
        }
        .notice-delete:hover { background: #e73d57; }

        /* 드롭다운 컨트롤 영역 */
        .filter-bar { display: flex; align-items: center; gap: 8px; margin-top: 10px; }
        select { padding: 4px 6px; }

    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">
    <div class="title">관리자 페이지</div>
    <div class="logout-nav">
        <button onclick="window.location.href='/logout'">로그아웃</button>
    </div>
</nav>
<!-- // 상단 네비게이션 -->

<div class="page-container">
    <div class="page-content">
        <div class="container">
            <!-- 상단 탭 링크 -->
            <div class="top-link">
                <a href="${pageContext.request.contextPath}/admin/adminPage" class="tab-button">사용자 관리</a>
                <a href="${pageContext.request.contextPath}/admin/notice" class="tab-button" style="color:#1E4CD1;">커뮤니티</a>
                <a href="${pageContext.request.contextPath}/admin/adminBadgePage" class="tab-button">뱃지</a>
            </div>

            <!-- 필터 / 카테고리 선택 -->
            <div class="filter-bar">
                <label for="categorySelect">목록 선택:</label>
                <select id="categorySelect">
                    <option value="notices" ${type eq 'notices' ? 'selected' : ''}>공지사항</option>
                    <option value="reports" ${type eq 'reports' ? 'selected' : ''}>신고된 게시물</option>
                    <option value="registPlace" ${type eq 'registPlace' ? 'selected' : ''}>명소 등록 요청</option>
                </select>
            </div>

            <h2 style="margin:15px 0 10px;">공지사항</h2>

            <!-- 공지사항 카드 목록 -->
            <div class="notice-list">
                <c:forEach var="notice" items="${list}">
                    <div class="notice-card clickable-row"
                         data-href="${pageContext.request.contextPath}/community/notice/${notice.noticeId}?source=admin">
                        <span class="notice-title">${notice.title}</span>
                        <span class="notice-date"><fmt:formatDate value="${notice.regDate}" pattern="yy-MM-dd HH:mm"/></span>

                        <!-- 삭제 버튼 (카드 내부에 있지만 이벤트 분리) -->
                        <form action="${pageContext.request.contextPath}/admin/notice/deleteNotice" method="post"
                              onclick="event.stopPropagation();" style="margin:0;">
                            <input type="hidden" name="noticeId" value="${notice.noticeId}" />
                            <button type="submit" class="notice-delete"
                                    onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                        </form>
                    </div>
                </c:forEach>
            </div>

            <!-- 글쓰기 버튼 -->
            <button type="button" style="float:right; margin-top:10px;"
                    onclick="location.href='${pageContext.request.contextPath}/admin/notice/write'">
                글쓰기
            </button>
        </div>
    </div>
</div>

<!-- 하단 네비 -->
<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const select = document.getElementById('categorySelect');
        select.addEventListener('change', function () {
            const selectedType = this.value;
            console.log("선택된 타입:", selectedType); // 🔥 반드시 보고
            window.location.href = "/admin/notice?type=" + selectedType;
        });

        const rows = document.querySelectorAll(".clickable-row");
        rows.forEach(row => {
            row.addEventListener("click", function () {
                const href = this.dataset.href;
                if (href) {
                    window.location.href = href;
                }
            });
        });
    });
</script>
</body>
</html>