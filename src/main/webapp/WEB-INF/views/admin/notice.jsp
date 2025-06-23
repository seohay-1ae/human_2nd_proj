<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>공지사항</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
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
    .page-container {
      margin-top: 70px;
      padding: 20px;
    }
    .write-button {
      margin-top: 20px;
      display: inline-block;
    }
  </style>
</head>
<body>

  <nav class="top-nav">
    <div class="logo">
      <img src="${pageContext.request.contextPath}/logo.png" alt="logo" />
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

                    <h2>공지사항</h2>

                    <table border="1" width="100%">
                      <thead>
                        <tr>

                          <th>제목</th>
                          <th>작성일</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="notice" items="${list}">
                          <tr>

                            <td>
                              <a href="${pageContext.request.contextPath}/admin/notice/${notice.noticeId}">
                                ${notice.title}
                              </a>
                            </td>
                            <td><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd " /></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/notice/deleteNotice" method="post" style="display:inline;">
                                  <input type="hidden" name="noticeId" value="${notice.noticeId}" />
                                  <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                                </form>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>

                    <a class="write-button" href="${pageContext.request.contextPath}/admin/notice/write">글쓰기</a>
          </div>
        </div>
    </div>
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