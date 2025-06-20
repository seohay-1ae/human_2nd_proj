package com.project.travelquest.user.controller;

import com.project.travelquest.user.service.SUserService;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class FindEmailController {

    //UserService 호출(DB에 저장하기 위해)(DB에 저장된 정보를 불러오기 위해)
    @Autowired
    SUserService sUserService;

    @GetMapping("/user/username")
    @ResponseBody
    public UserVO getUserInfoByUsername(@RequestParam String username) {
        return sUserService.getUserByUsername(username);
    }

    //이메일 찾기 폼 페이지
    @GetMapping ("/findEmail")
    public String findEmailForm(){
        return "mypage/findEmail";
    }

    //이메일 찾기 폼 처리
    @PostMapping("/findEmail")
    public String processFindEmail(@ModelAttribute UserVO user, Model model) {
        String username = user.getUsername(); // 입력값에서 이름 가져오기
        UserVO foundUser = sUserService.getUserByUsername(username);

        if (foundUser != null) {
            model.addAttribute("email", foundUser.getEmail());
        } else {
            model.addAttribute("email", "해당 이메일이 존재하지 않습니다.");
        }
        System.out.println("입력된 이메일: " + username);
        return "mypage/findEmail_success";
    }
}