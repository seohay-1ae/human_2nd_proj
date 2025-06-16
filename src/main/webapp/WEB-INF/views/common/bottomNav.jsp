<!-- /WEB-INF/views/common/bottomNav.jsp -->
<<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Bootstrap Icons (최신 버전 CDN) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>
  .bottom-nav {
    position: fixed;
    bottom: 0;
    width: 100%;
    height: 60px;
    background: #fff;
    border-top: 1px solid #ccc;
    display: flex;
    justify-content: space-around;
    align-items: center;
    z-index: 999;
  }
  .nav-item {
    text-align: center;
    font-size: 12px;
    color: #333;
    text-decoration: none;
  }
  .nav-item img {
    width: 24px;
    height: 24px;
    display: block;
    margin: 0 auto 2px;
  }
  .nav-item.active {
    color: red;
    font-weight: bold;
  }
  .nav-item:hover {
    color: #007bff; /* hover 시 텍스트 색상 */
  }

  .nav-item:hover i {
    color: #007bff; /* hover 시 아이콘 색상 */
  }
</style>

<nav class="bottom-nav">
  <a href="/travel" class="nav-item ${pageName eq 'travel' ? 'active' : ''}">
    <i class="bi bi-suitcase-lg" style="font-size: 24px;"></i>
    <br/>
    여행지역
  </a>
  <a href="/community" class="nav-item ${pageName eq 'community' ? 'active' : ''}">
    <i class="bi bi-crosshair" style="font-size: 24px;"></i>
    <br/>
    내 위치
  </a>
  <a href="/community" class="nav-item ${pageName eq 'community' ? 'active' : ''}">
    <i class="bi bi-chat-dots" style="font-size: 24px;"></i>
    <br/>
    커뮤니티
  </a>
  <a href="/badges" class="nav-item ${pageName eq 'badges' ? 'active' : ''}">
    <i class="bi bi-award" style="font-size: 24px;"></i>
    <br/>
    나의 뱃지
  </a>
  <a href="/mypage" class="nav-item ${pageName eq 'mypage' ? 'active' : ''}">
    <i class="bi bi-person" style="font-size: 26px;"></i>
    <br/>
    마이페이지
  </a>
</nav>