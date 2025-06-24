package com.project.travelquest.user.controller;

// AuthController.java (또는 UserController 등)
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 종료
        return "redirect:/loginSelect"; // 로그인셀렉트 폼으로 리다이렉트
    }
}

