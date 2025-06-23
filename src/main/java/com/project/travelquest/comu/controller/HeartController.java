package com.project.travelquest.comu.controller;

import com.project.travelquest.comu.service.ComuService;
import com.project.travelquest.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class HeartController {

    @Autowired
    private ComuService comuService;

    @PostMapping("/community/heart")
    public Map<String, Object> toggleHeart(@RequestBody Map<String, Object> payload,
                                           HttpSession session) {
        int postId = ((Number) payload.get("postId")).intValue();

        // 세션에서 로그인된 사용자 가져오기
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        // 로그인 상태가 아니라면 예외 응답
        if (loginUser == null) {
            Map<String, Object> error = new HashMap<>();
            error.put("result", "unauthorized");
            return error;
        }

        // 로그인된 사용자 ID 사용
        String userId = String.valueOf(loginUser.getUser_id());

        boolean liked = comuService.toggleHeart(postId, userId);
        int heartCount = comuService.getHeartCount(postId);

        Map<String, Object> result = new HashMap<>();
        result.put("result", liked ? "liked" : "unliked");
        result.put("heartCount", heartCount);

        return result;
    }
}
