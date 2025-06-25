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


    <!-- 공통 및 페이지별 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>

    <style>
        /* 기본 테이블 스타일 */
        table {
            border-collapse: collapse;
            border: 2px solid #ccc;
            min-width: 800px;
            width: 100%;
        }

        thead th {
            background-color: #b3e9ee;
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
            white-space: nowrap;
        }

        tbody td {
            border: 1px solid #ccc;
            padding: 10px;
            vertical-align: top;
        }

        .table-container {
            overflow-x: auto;
            max-width: 100%;
            margin: 20px 0;
        }

        /* 말줄임표용 셀 */
        .ellipsis {
            max-width: 150px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* 줄바꿈 방지용 셀 */
        .nowrap {
            white-space: nowrap;
        }

        /* 버튼 그룹 */
        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .action-buttons button {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
        }

        .approve {
            background-color: #4CAF50;
            color: white;
        }

        .reject {
            background-color: #f44336;
            color: white;
        }

        .approve:hover {
            background-color: #45a049;
        }

        .reject:hover {
            background-color: #e53935;
        }

        .ellipsis.expanded {
            white-space: normal;
            overflow: visible;
            text-overflow: unset;
            max-width: none;
        }

        #modalRowContent p {
            margin: 0; /* 위아래 마진 최소화 */
        }
    </style>
</head>

<body>
<!-- 상단 네비게이션 -->
<nav class="top-nav">

    <div class="title">
        관리자 페이지
    </div>
    <div class="logout-nav">
        <button onclick="window.location.href='/logout'">로그아웃</button>
    </div>

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


            <h2 style="margin-top: 10px;">명소신청 목록</h2>

            <div class="table-container">
                <table border="1">
                    <thead>
                    <tr>
                        <th>명소명</th>
                        <th>주소</th>
                        <th>작성자</th>
                        <th>소개글</th>
                        <th>이미지</th>
                        <th>신청일</th>
                        <th>승인/거절</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="place" items="${list}">
                        <tr onclick="openRowModal({
                                title: '${place.title}',
                                address: '${place.address}',
                                writer: '${place.writer}',
                                description: '${place.description}',
                                createdAt: '${fn:substring(place.createdAt, 0, 10)}',
                                imageUrl: '${pageContext.request.contextPath}/upload/${place.imageUrl}'
                                })" style="cursor:pointer;">
                            <td class="ellipsis">${place.title}</td>
                            <td class="ellipsis">${place.address}</td>
                            <td class="nowrap">${place.writer}</td>
                            <td class="ellipsis">${place.description}</td>
                            <td>
                                <c:if test="${not empty place.imageUrl}">
                                    <img src="${pageContext.request.contextPath}/upload/${place.imageUrl}" width="80"/>
                                </c:if>
                            </td>
                            <td class="nowrap">
                                <fmt:formatDate value="${place.createdAt}" pattern="yy-MM-dd"/>
                            </td>
                            <td class="action-buttons">
                                <button class="approve">승인</button>
                                <button class="reject">거절</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- 행 전체 정보 표시용 모달 -->
            <!-- 모달 본문 래퍼에 flex column 적용해서 버튼 오른쪽 정렬 및 간격 확보 -->
            <div id="rowModal" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh;
    background:rgba(0,0,0,0.5); justify-content:center; align-items:center; z-index:9999;">
                <div style="background:white; padding:20px; border-radius:10px; max-width:420px; width:90%; max-height: 80vh; display: flex; flex-direction: column;">
                    <h3>명소 신청 상세</h3>
                    <div id="modalRowContent"
                         style="white-space:pre-wrap; line-height:0.8; max-height: 60vh; overflow-y: auto; flex-grow: 1;"></div>
                    <div style="display: flex; justify-content: flex-end; margin-top: 10px;">
                        <button onclick="closeRowModal()">닫기</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>

<!-- 하단 nav바 -->
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

    function openRowModal(data) {
        let modalContent = `
            <p><b>🗺️ 명소명:</b> \${data.title}</p>
            <p><b>🏠 주소:</b> \${data.address}</p>
            <p><b>✍️ 작성자:</b> \${data.writer}</p>
            <p><b>📃 소개글:</b><br><br><br>\${data.description}</p>
            <p><b>🕒 신청일:</b> \${data.createdAt}</p>
        `;
        /* 이미지가 있는 경우 이미지도 추가*/
        if (data.imageUrl && data.imageUrl.trim() !== '') {
            modalContent += `<p><img src="\${data.imageUrl}" alt="이미지" style="max-width:100%; height:auto; margin-top:10px;" /></p>`;
        }

        document.getElementById("modalRowContent").innerHTML = modalContent;
        document.getElementById("rowModal").style.display = "flex";
    }

    function closeRowModal() {
        document.getElementById("rowModal").style.display = "none";
    }

</script>
</body>
</html>