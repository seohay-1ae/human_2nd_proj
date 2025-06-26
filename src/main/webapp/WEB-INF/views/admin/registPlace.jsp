<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>명소신청 목록</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        /* ───────────── 공통 레이아웃 */
        .page-content {
            padding-bottom: 120px;
        }

        .top-link {
            margin: 20px 0;
        }

        .top-link a {
            font-size: 18px;
            font-weight: 600;
            margin-right: 15px;
        }

        /* 드롭다운 컨트롤 영역 */
        .filter-bar {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 10px;
        }

        select {
            padding: 4px 6px;
        }

        /* ───────────── 카드형 명소 목록 */
        .place-list {
            margin-top: 20px;
        }

        .place-card {
            background: #f5f5f5;
            border-radius: 10px;
            padding: 12px 14px;
            margin-bottom: 12px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, .1);
            transition: background .15s ease;
        }

        /* 내부 레이아웃 */
        .place-header {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 8px
        }

        .place-title {
            font-weight: 700;
            color: #1E4CD1
        }

        .place-writer {
            margin-left: auto;
            white-space: nowrap;
            color: #555;
            font-size: .9rem
        }

        .place-address {
            flex-basis: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color: #333
        }

        .place-desc {
            margin: 6px 0;
            color: #222;
            font-size: .95rem
        }

        .place-meta {
            display: flex;
            align-items: center;
            gap: 10px
        }

        .place-image {
            width: 250px;
            flex-shrink: 0;
            border-radius: 6px;
            object-fit: cover
        }

        /* 승인/거절 + 날짜 */
        .action-buttons {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 6px
        }

        .action-buttons button {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer
        }

        .approve {
            background: #4CAF50;
            color: #fff
        }

        .reject {
            background: #f44336;
            color: #fff
        }

        .approve:hover {
            background: #45a049
        }

        .reject:hover {
            background: #e53935
        }

        .done {
            background: #9e9e9e;
            color: #fff;
            cursor: default
        }

        .done:hover {
            background: #9e9e9e
        }

        .place-date {
            margin-left: auto;
            font-size: .85rem;
            color: #666;
            white-space: nowrap
        }

        .action-buttons .status {
            background: #9e9e9e;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            font-weight: 600;
            font-size: 14px;
            cursor: default;
        }
    </style>
</head>
<body>
<nav class="top-nav">
    <div class="title">관리자 페이지</div>
    <div class="logout-nav">
        <button onclick="window.location.href='/logout'">로그아웃</button>
    </div>
</nav>

<div class="page-container">
    <div class="page-content">
        <div class="container">
            <!-- 탭 링크 -->
            <div class="top-link">
                <a href="${pageContext.request.contextPath}/admin/adminPage" class="tab-button">사용자 관리</a>
                <a href="${pageContext.request.contextPath}/admin/notice" class="tab-button"
                   style="color:#1E4CD1;">커뮤니티</a>
<%--                <a href="${pageContext.request.contextPath}/admin/adminBadgePage" class="tab-button">뱃지</a>--%>
            </div>

            <!-- 카테고리 선택 -->
            <div class="filter-bar">
                <label for="categorySelect">목록 선택: </label>
                <select id="categorySelect">
                    <option value="notices" ${type eq 'notices' ? 'selected' : ''}>공지사항</option>
                    <option value="reports" ${type eq 'reports' ? 'selected' : ''}>신고된 게시물</option>
                    <option value="registPlace" ${type eq 'registPlace' ? 'selected' : ''}>명소 등록 요청</option>
                </select>
            </div>

            <h2 style="margin:15px 0 10px;">명소신청 목록</h2>

            <!-- 명소 카드 목록 -->
            <div class="place-list">
                <c:forEach var="place" items="${list}">
                    <div class="place-card">
                        <div class="place-header">
                            <span class="place-title">${place.title}</span>
                            <span class="place-writer">${place.writer}</span>
                            <span class="place-address">${place.address}</span>
                        </div>
                        <div class="place-desc">
                            <c:choose>
                                <c:when test="${fn:length(place.description) > 20}">${fn:substring(place.description,0,20)}...</c:when>
                                <c:otherwise>${place.description}</c:otherwise>
                            </c:choose>
                        </div>
                        <div class="place-meta">
                            <c:if test="${not empty place.imageUrl}">
                                <img src="${pageContext.request.contextPath}/upload/${place.imageUrl}"
                                     class="place-image"/>
                            </c:if>
                        </div>
                        <div class="action-buttons" onclick="event.stopPropagation();">
                            <button class="approve">승인</button>
                            <button class="reject">거절</button>
                            <button class="status">처리대기중</button>
                            <span class="place-date"><fmt:formatDate value="${place.createdAt}"
                                                                     pattern="yy-MM-dd"/></span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottomNav.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 카테고리 변경
        document.getElementById('categorySelect').addEventListener('change', function () {
            window.location.href = '/admin/notice?type=' + this.value;
        });

        // 승인/거절 버튼 처리
        document.querySelectorAll('.approve, .reject').forEach(button => {
            button.addEventListener('click', function (e) {
                e.stopPropagation(); // 카드 클릭 방지

                const isApprove = this.classList.contains('approve');
                alert(isApprove ? '승인되었습니다.' : '거절되었습니다.');

                const container = this.parentElement; // .action-buttons
                const statusBtn = container.querySelector('.status');

                // 상태 버튼 텍스트 및 스타일 변경
                if (statusBtn) {
                    statusBtn.textContent = isApprove ? '처리완료(승인)' : '처리완료(거절)';
                    statusBtn.classList.remove('done');
                    statusBtn.classList.add('done');
                }
            });
        });
    });
</script>
</body>
</html>
