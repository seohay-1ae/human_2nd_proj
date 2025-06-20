package com.project.travelquest.user.controller;

import com.project.travelquest.user.dto.EmailCheckResponse;
import com.project.travelquest.user.service.SUserService;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SignUpController {

    //UserService 호출(DB에 저장하기 위해)
    @Autowired
    SUserService sUserService;

    // 이메일 중복 확인용 Api
    @GetMapping("/check-user_email")
    @ResponseBody
    public EmailCheckResponse checkEmail(@RequestParam("user_email") String user_email) {
        boolean exists = sUserService.existsByEmail(user_email);
        return new EmailCheckResponse(exists);
    }

    //회원가입 폼 페이지
    @GetMapping ("/signUp")
    public String signUpForm(){
        return "mypage/signUp";
    }

    //회원가입 폼 처리
    @PostMapping("/signUp")
    public String processSignUp(@ModelAttribute UserVO user, Model model) {

        // 모든 회원가입 처리 로직을 UserService에 위임
        String errorMessage = sUserService.validateAndSaveUser(user);
        if (errorMessage != null) {
            model.addAttribute("error", errorMessage);
            return "mypage/signUp";
        }

        //화면 출력만 하는 로직
        model.addAttribute("user_email", user.getUser_email() );
        model.addAttribute("user_name", user.getUser_name() );

        return "mypage/signUp_success";
    }
}