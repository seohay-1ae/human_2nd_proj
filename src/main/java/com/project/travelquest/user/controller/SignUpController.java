package com.project.travelquest.user.controller;

import com.project.travelquest.user.dto.EmailCheckResponse;
import com.project.travelquest.user.service.UserService;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

@Controller
public class SignUpController {

    //UserService 호출(DB에 저장하기 위해)
    @Autowired
    UserService userService;

    // 이메일 중복 확인용 Api
    @GetMapping("/check-email")
    @ResponseBody
    public EmailCheckResponse checkEmail(@RequestParam("email") String email) {
        boolean exists = userService.existsByEmail(email);
        return new EmailCheckResponse(exists);
    }

    //회원가입 폼 페이지
    @GetMapping ("/signup")
    public String signupForm(){
        return "mypage/signup";
    }

    //회원가입 폼 처리
    @PostMapping("/signup")
    public String processSignup(@ModelAttribute UserVO user, HttpSession session, Model model) {

        // 모든 회원가입 처리 로직을 UserService에 위임
        String errorMessage = userService.validateAndSaveUser(user);
        if (errorMessage != null) {
            model.addAttribute("error", errorMessage);
            return "mypage/signup";
        }

        //화면 출력만 하는 로직
        model.addAttribute("email", user.getEmail() );
        model.addAttribute("username", user.getUsername() );

        return "mypage/signup_success";
    }
}