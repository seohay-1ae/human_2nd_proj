package com.project.travelquest.comu.controller;

import com.project.travelquest.comu.service.ComuCommentService;
import com.project.travelquest.comu.vo.ComuCommentVO;
import com.project.travelquest.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ComuCommentController {

    @Autowired
    private ComuCommentService comuCommentService;

    /**
     * ✅ 댓글 등록만 담당 (화면 처리 없음)
     */
    @PostMapping("/community/comment/write")
    public String insertComment(@ModelAttribute ComuCommentVO comment, HttpSession session) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            // 로그인 안 했으면 로그인 페이지로 리다이렉트하거나 예외 처리
            return "redirect:/login";
        }

        // 작성자 이름 세션에서 가져와서 설정
        comment.setWriter(loginUser.getUser_name());

        comuCommentService.insertComment(comment);
        return "redirect:/community/comment?id=" + comment.getPostId();
    }
}