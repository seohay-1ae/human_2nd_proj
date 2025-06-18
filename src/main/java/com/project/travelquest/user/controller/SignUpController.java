package com.project.travelquest.user.controller;

import com.project.travelquest.user.dto.EmailCheckResponse;
import com.project.travelquest.user.service.UserService;
import com.project.travelquest.user.util.PasswordValidator;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SignUpController {

    //UserService 호출(DB에 저장하기 위해)
    @Autowired
    private UserService userService;

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
    public String processSignup(@ModelAttribute UserVO user, Model model) {

        //비밀번호 확인 검사
        if (!PasswordValidator.isValid(user.getPassword(), user.getPassword_check())) {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            return "mypage/signup";
        }

        //서버에서도 이메일 중복 검사를 한 번 더
        if (userService.existsByEmail(user.getEmail())) {
            model.addAttribute("error", "이미 존재하는 이메일입니다.");
            return "mypage/signup";
        }

        // DB에 저장
        userService.saveUser(user);

        //화면 출력만 하는 로직
        model.addAttribute("email", user.getEmail() );
        model.addAttribute("username", user.getUsername() );

        return "mypage/signup_success";
    }
}
