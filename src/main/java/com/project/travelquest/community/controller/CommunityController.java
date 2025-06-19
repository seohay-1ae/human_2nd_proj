package com.project.travelquest.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
    @GetMapping("/community")
    public String showCommunityPage() {
        return "community/board";
    }
    @GetMapping("/community/write")
    public String showWritePage() {
        return "community/write";
    }
    @GetMapping("/community/comment")
    public String showCommentPage() {
        return "community/comment"; // → comment.jsp
    }
}
