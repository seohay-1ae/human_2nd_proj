package com.project.travelquest.user.controller;

import com.project.travelquest.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class UserControllerImpl implements UserController {

    @GetMapping("/loginSelect")
    public String loginSelect() {
        return "mypage/loginSelect";
    }

    @GetMapping("/loginForm")
    public String LoginForm() {
        return "mypage/loginForm";
    }

    @GetMapping("/joinForm")
    public String JoinForm() {
        return "mypage/joinForm";
    }
}
