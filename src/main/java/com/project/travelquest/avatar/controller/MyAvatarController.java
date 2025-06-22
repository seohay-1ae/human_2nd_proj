package com.project.travelquest.avatar.controller;

import com.project.travelquest.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.Map;

import com.project.travelquest.avatar.service.AvatarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyAvatarController {

    private final AvatarService avatarService;

    @Autowired
    public MyAvatarController(AvatarService avatarService) {
        this.avatarService = avatarService;
    }

    @GetMapping("/myavatar")
    public String myAvatar(HttpSession session, Model model) {
        // 세션에서 로그인한 유저 꺼내기
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login"; // 로그인 안 된 상태면 로그인 폼으로
        }

        String userEmail = loginUser.getUser_email(); // 로그인할 때 입력했던 이메일

        Map<String, String> avatarPaths = avatarService.getAvatarPathsByEmail(userEmail);
        System.out.println("avatarPaths: " + avatarPaths);

        model.addAttribute("avatarPaths", avatarPaths);

        return "mypage/myAvatar";
    }
};
