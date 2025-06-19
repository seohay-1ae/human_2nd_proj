package com.project.travelquest.mypage.controller;
import com.project.travelquest.user.vo.UserVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpSession;

@Controller
public class MypageController {

    @RequestMapping("/mypage") // mypage/index.jsp
    public String mypageIndex() {
        return "mypage/index";
    }

    @RequestMapping("/loginDummy") //테스트용 로그인 상태 mypage/index.jsp
    public String loginDummy(HttpSession session) {
        UserVO dummy = new UserVO();
        dummy.setName("테스트계정");
        dummy.setEmail("test@aaa.com");
        session.setAttribute("loginUser", dummy);
        return "redirect:/mypage"; // 로그인 후 마이페이지 이동
    }

    @RequestMapping("/mypage/login") // mypage/index.jsp
    public String mypageLogin(HttpSession session) {
        return "mypage/loginForm";
    }
    @RequestMapping("/mypage/termsAndPrivacy")
    public String termsAndPrivacy() {
        return "mypage/termsAndPrivacy";
    }
    @RequestMapping("/mypage/customerCenter")
    public String customerCenter() {
        return "mypage/customerCenter";
    }
}
