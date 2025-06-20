package com.project.travelquest.user.controller;

import com.project.travelquest.user.service.UserService;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/mypage/api")
public class UserRestController {

    @Autowired
    UserService userService;

    @GetMapping("/list")
    public List<UserVO> getUserList() {
        List<UserVO> usersList = null;
        try{
            usersList = userService.listUsers();
        } catch (Exception e) {
            System.out.println("오류 발생:"+e.getMessage());
        }
        return usersList;
    }
}
