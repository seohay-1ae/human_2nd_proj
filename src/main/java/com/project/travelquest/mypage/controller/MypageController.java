package com.project.travelquest.mypage.controller;

import com.project.travelquest.user.service.UserService;
import com.project.travelquest.user.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpSession;

@Controller
public class MypageController {

    @Autowired
    UserService userService;

    // 로그인하기 / 이메일로 가입하기 선택하는 페이지
    @RequestMapping("/loginSelect")
    public String loginSelect() {
        return "mypage/loginSelect";
    }

    // 이메일로 가입하기
    @RequestMapping("/joinForm")
    public String joinForm() {
        return "mypage/joinForm";
    }

    // 마이페이지
    @RequestMapping("/mypage") // mypage/index.jsp
    public String mypageIndex() {
        return "mypage/index";
    }

    // 로그인하기
    @RequestMapping("/login")
    public String login() {
        return "mypage/loginForm";
    }

    // 약관
    @RequestMapping("/termsAndPrivacy")
    public String termsAndPrivacy() {
        return "mypage/termsAndPrivacy";
    }

    // 고객센터
    @RequestMapping("/customerCenter")
    public String customerCenter() {
        return "mypage/customerCenter";
    }

    @PostMapping("/login")
    public String login(UserVO userVO, HttpSession session, Model model) {

        UserVO loginUser = userService.login(userVO);

        if (loginUser != null) {
            session.setAttribute("loginUser", loginUser);
            System.out.println("로그인 성공");
            return "redirect:/mypage";
        } else {
            model.addAttribute("message", "fail");
            System.out.println("로그인 실패");
            return "mypage/loginForm";
        }
    }
};
