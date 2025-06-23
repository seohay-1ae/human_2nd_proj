<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 관광지 상세 모달 공통 include -->
<div id="placeModal" style="display: none; position: fixed; top: 0; left: 0; width: 100vw; height: 100vh;
     background-color: rgba(0, 0, 0, 0.5); z-index: 1000; overflow-y: auto;">
    <div class="modal-content" style="width: 100vw; max-width: 420px; margin: 0 auto; top: 0; height: 100%;
         background: white; z-index: 1000; padding: 20px; overflow-y: auto; box-sizing: border-box; position: relative;">
        <span id="modalClose" style="position: absolute; top: 6px; right: 3px; font-size: 24px; font-weight: bold;
             color: #2f65f8; cursor: pointer; user-select: none;">×</span>
        <div id="placeDetailContainer">불러오는 중...</div>
    </div>
</div>
