package com.project.travelquest.user.controller;

import com.project.travelquest.user.service.UserService;
import com.project.travelquest.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/mypage")
public class UserControllerImpl implements UserController {

    @Autowired
    UserService userService;

    @GetMapping("/loginSelect")
    public String loginSelect() {
        return "mypage/loginSelect";
    }

    @GetMapping("/loginForm")
    public String LoginForm() {
        return "mypage/loginForm";
    }

    @GetMapping("/findEmail")
    public String findEmailForm() {
        return "mypage/findEmail";}

    @GetMapping("/signUp")
    public String signUpForm() {
        return "mypage/signUp";
    }

    @GetMapping("/listUsers")
    public String listUsers(Model model) throws Exception {

        List<UserVO> usersList = userService.listUsers();
        model.addAttribute("usersList", usersList);
        return "mypage/listUsers";
    }

    @PostMapping("/login")
    public String login(UserVO userVO, HttpSession session, Model model) {

        UserVO loginUser = userService.login(userVO);

        if (loginUser != null) {
            session.setAttribute("loginUser", loginUser);
            System.out.println("로그인 성공");
            return "mypage/loginForm_success";
//            return "redirect:/mypage/main";
        } else {
            model.addAttribute("message", "fail");
            System.out.println("로그인 실패");
            return "mypage/loginForm";
        }



    }
}
