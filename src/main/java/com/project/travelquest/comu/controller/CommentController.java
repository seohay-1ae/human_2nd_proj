package com.project.travelquest.comu.controller;

import com.project.travelquest.comu.service.ComuCommentService;
import com.project.travelquest.comu.service.ComuService;
import com.project.travelquest.comu.vo.ComuCommentVO;
import com.project.travelquest.comu.vo.ComuVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CommentController {

    @Autowired
    private ComuService comuService;

    @Autowired
    private ComuCommentService comuCommentService;

    /**
     * ✅ 댓글 보기 화면 처리
     */
    @GetMapping("/community/comment")
    public String showCommentPage(@RequestParam("id") int postId, Model model) {
        ComuVO post = comuService.getPostDetail(postId);
        List<ComuCommentVO> comments = comuCommentService.getCommentListByPostId(postId);
        post.setComments(comments);
        model.addAttribute("post", post);
        return "community/comment"; // → comment.jsp
    }
}
