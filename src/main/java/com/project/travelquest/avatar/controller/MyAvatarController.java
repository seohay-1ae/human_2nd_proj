package com.project.travelquest.avatar.controller;

import com.project.travelquest.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.project.travelquest.avatar.service.AvatarService;
import com.project.travelquest.avatar.service.MyAvatarService;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Controller
public class MyAvatarController {

    private final MyAvatarService myavatarService;

    @Autowired
    public MyAvatarController(MyAvatarService myavatarService) {
        this.myavatarService = myavatarService;
    }

    @GetMapping("/myavatar")
    public String myAvatar(HttpSession session, Model model) {
        // 세션에서 로그인한 유저 꺼내기
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login"; // 로그인 안 된 상태면 로그인 폼으로
        }

        String userEmail = loginUser.getUser_email(); // 로그인할 때 입력했던 이메일

        Map<String, String> avatarPaths = myavatarService.getAvatarPathsByEmail(userEmail);
        System.out.println("avatarPaths: " + avatarPaths);

        model.addAttribute("avatarPaths", avatarPaths);

        return "mypage/myAvatar";
    }


    @PostMapping("/avatar/save")
    @ResponseBody
    public ResponseEntity<?> saveAvatarPreset(@RequestBody Map<String, String> avatarData, HttpSession session) {
        // principal로 로그인한 사용자 정보 얻기 (예: user_email)
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        String userEmail = loginUser.getUser_email();
        System.out.println("userEmail: " + userEmail);
        try {
            myavatarService.saveAvatarPreset(userEmail, avatarData);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("저장 실패");
        }
    }
}


