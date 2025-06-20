package com.project.travelquest.admin.controller;

import com.project.travelquest.admin.service.UserService;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @GetMapping("/admin/userlist")
    public String showUserList(Model model) {
        List<UserVO> userList = userService.getAllUsers();
        model.addAttribute("userList", userList); // JSP로 전달
        return "adminUserList"; // adminUserList.jsp
    }
}
