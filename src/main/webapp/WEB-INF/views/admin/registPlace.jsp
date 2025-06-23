<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>공지사항</title>


  <!-- 공통 및 페이지별 CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/각 페이지에서만 쓰이는 css(만들것).css"/>

  <style>
      .top-nav {
        position: fixed;
        top: 0;
        width: 100%;
        height: 60px;
        background: #fff;
        border-bottom: 1px solid #ccc;
        display: flex;
        justify-content: space-around;
        align-items: center;
        z-index: 999;
      }
      .logo {
        width: 50%;
      }
      .page-container {
        margin-top: 70px;
      }
      .comments-link {
        text-decoration: none;
        color: inherit;
        margin-left: 10px;
      }
      .write-button {
        margin-top: 30px;
        display: block;
        width: 100%;
        padding: 15px;
        font-size: 16px;
      }
      .likes {
        cursor: pointer;
      }
      .likes i {
        margin-right: 5px;
      }
    </style>
</head>

<body>
  <nav class="top-nav">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/logo.png" alt="logo"/>
        </div>
    </nav>
  <div class="page-container">
    <div class="page-content">
      <div class="container">

    <div>
        <label for="categorySelect">목록 선택: </label>
        <select id="categorySelect">
            <option value="notices" ${type eq 'notices' ? 'selected' : ''}>공지사항</option>
            <option value="reports" ${type eq 'reports' ? 'selected' : ''}>신고된 게시물</option>
            <option value="registPlace" ${type eq 'registPlace' ? 'selected' : ''}>명소 등록 요청</option>
        </select>
    </div>


        <h2>명소신청 목록</h2>
          <table border="1">
            <tr>
              <th>번호</th>
              <th>명소명</th>
              <th>주소</th>
              <th>작성자</th>
              <th>소개글</th>
              <th>이미지</th>
              <th>신청일</th>
              <!-- <th>승인/거절</th> -->
            </tr>
            <c:forEach var="place" items="${list}">
              <tr>
                <td>${place.id}</td>
                <td>${place.title}</td>
                <td>${place.address}</td>
                <td>${place.writer}</td>
                <td>${place.description}</td>
                <td>
                  <c:if test="${not empty place.imageUrl}">
                    <img src="${pageContext.request.contextPath}/upload/${place.imageUrl}" width="80"/>
                  </c:if>
                </td>
                <td>${place.createdAt}</td>
              </tr>
            </c:forEach>


        <br>


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
  </script>
</body>
</html>