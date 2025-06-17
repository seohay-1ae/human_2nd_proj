package com.project.travelquest.member.controller;

import com.project.travelquest.member.service.UserService;
import com.project.travelquest.member.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SignUpController {

    @Autowired
    private UserService userService;

    // 이메일 중복 확인용 (AJAX 용)서비스/DB 체크 로직
    @GetMapping("/check-email")
    @ResponseBody
    public String checkEmail(@RequestParam String email) {
        // DB에서 이메일(id) 존재 여부 확인
        boolean exists = userService.existsByEmail(email); //직접 구현
        return exists ? "duplicate" : "available";
    }
    //회원가입 폼 페이지
    @GetMapping ("/signup")
        public String signupForm(){
            return "mypage/signup";
        }
    
    //회원가입 폼 처리
    @PostMapping("/signup")
    public String processSignup(@ModelAttribute UserVO user, Model model) {

        //서버에서도 이메일 중복 검사를 한 번 더
        if (userService.existsByEmail(user.getEmail())) {
            model.addAttribute("error", "이미 존재하는 이메일입니다.");
            return "mypage/signup";
        }

        if (!user.getPassword().equals(user.getPasswordCheck())) {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            return "mypage/signup"; //회원가입 페이지로 다시 이동
        }
        // DB 저장 로직이 필요함
        // 실제 회원 저장 로직
        userService.saveUser(user);

        // 화면 출력만 하는 로직
        model.addAttribute("email", user.getEmail() );
        model.addAttribute("name", user.getUsername() );

        return "mypage/signup_success";
    }

}
