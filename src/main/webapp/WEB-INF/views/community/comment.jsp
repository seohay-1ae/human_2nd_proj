<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>댓글 페이지</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
</head>
<body>

  <!-- 게시글 정보 -->
  <div class="post-box">
    <strong>작성자:</strong> ${post.writer} <br />
    <strong>작성일:</strong> ${post.createdAt} <br /><br />
    <div>${post.content}</div>
  </div>

  <!-- 댓글 목록 -->
  <h4>댓글 목록</h4>
  <c:forEach var="comment" items="${post.comments}">
    <div class="comment-box">
      <strong>${comment.writer}</strong> (${comment.createdAt})<br/>
      ${comment.content}
    </div>
  </c:forEach>

  <!-- 댓글 작성 폼 -->
  <div class="form-box">
    <form action="${pageContext.request.contextPath}/community/comment/write" method="post">
      <input type="hidden" name="postId" value="${post.postId}" />
      <textarea name="content" placeholder="댓글을 입력하세요" required></textarea>
      <button type="submit">등록</button>
    </form>
  </div>

  <!-- 뒤로가기 버튼 -->
  <a href="${pageContext.request.contextPath}/community">
    <button>← 목록으로</button>
  </a>

</body>
</html>