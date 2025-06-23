package com.project.travelquest.user.controller;

import com.project.travelquest.user.service.UserService;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class FindEmailController {

    //UserService 호출(DB에 저장하기 위해)(DB에 저장된 정보를 불러오기 위해)
    @Autowired
    UserService UserService;

    @GetMapping("/user/user_name")
    @ResponseBody
    public UserVO getUserInfoByUsername(@RequestParam String user_name) {
        return UserService.getUserByUsername(user_name);
    }

    //이메일 찾기 폼 페이지
    @GetMapping ("/findEmail")
    public String findEmailForm(){
        return "mypage/findEmail";
    }

    //이메일 찾기 폼 처리
    @PostMapping("/findEmail")
    public String processFindEmail(@ModelAttribute UserVO user, Model model) {
        String user_name = user.getUser_name(); // 입력값에서 이름 가져오기
        UserVO foundUser = UserService.getUserByUsername(user_name);

        if (foundUser != null) {
            model.addAttribute("user_email", foundUser.getUser_email());
            System.out.println("받아온 이메일: " + foundUser.getUser_email());
        } else {
            model.addAttribute("user_email", "해당 이메일이 존재하지 않습니다.");
        }
        System.out.println("입력된 이름: " + user_name);
        System.out.println("조회된 이름: " + foundUser);
        return "mypage/findEmail_success";
    }
}