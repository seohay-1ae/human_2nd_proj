package com.project.travelquest.admin.controller;

import com.project.travelquest.admin.service.AdminUserService;
import com.project.travelquest.admin.vo.AdminUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminUserService adminUserService;

    //회원계정 맵핑(사용자 관리)
    @GetMapping("/admin/adminPage")
    public String showAdminPage(Model model) {
        List<AdminUserVO> userList = adminUserService.getAllUsers();
        model.addAttribute("userList", userList); // JSP로 전달
        return "admin/adminPage"; // adminPage.jsp
    }

    //회원계정 맵핑(여행지역 관리)
    @GetMapping("/admin/adminTravelPage")
    public String showAdminTravelPage() {
        return "admin/adminTravelPage"; // adminTravelPage.jsp
    }

    //회원계정 맵핑(커뮤니티 관리)
    @GetMapping("/admin/adminCommunityPage")
    public String showCommunityPage() {
        return "admin/adminCommunityPage"; // adminCommunityPage.jsp
    }

    //회원계정 맵핑(뱃지 관리)
    @GetMapping("/admin/adminBadgePage")
    public String showAdminBadgePage() {
        return "admin/adminBadgePage"; // adminBadgePage.jsp
    }

    //회원계정 삭제 기능
    @PostMapping("/admin/deleteUser")
    public String deleteUser(@RequestParam("userId") Long userId) {
        adminUserService.deleteUserById(userId);
        return "redirect:/admin/adminPage";
    }
}
