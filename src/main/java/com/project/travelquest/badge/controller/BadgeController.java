package com.project.travelquest.badge.controller;

import com.project.travelquest.badge.model.BadgeDTO;
import com.project.travelquest.badge.service.BadgeService;
import com.project.travelquest.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/badges")
public class BadgeController {

    @Autowired
    private BadgeService badgeService;

    // 뱃지 목록
    @GetMapping
    public String badgeList(HttpSession session,
                            @RequestParam(value = "unlocked", required = false) String unlocked,
                            Model model) {

        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로 튕김
        }

        Long userId = loginUser.getUser_id();
        List<BadgeDTO> badgeList = badgeService.getBadgesByUserId(userId);

        if ("true".equals(unlocked)) {
            badgeList.removeIf(b -> !"1".equals(b.getUserBadgeStatus()));
        } else if ("false".equals(unlocked)) {
            badgeList.removeIf(b -> !"0".equals(b.getUserBadgeStatus()));
        }

        model.addAttribute("badgeList", badgeList);
        return "badge/index";
    }

    // 상세 뱃지
    @GetMapping("/detail/{id}")
    public String badgeDetail(@PathVariable("id") Long badgeId,
                              HttpSession session,
                              Model model) {

        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로 튕김
        }

        Long userId = loginUser.getUser_id();
        BadgeDTO badge = badgeService.getBadgeDetail(userId, badgeId);

        if (badge == null) {
            return "redirect:/badges";
        }

        model.addAttribute("badge", badge);
        return "badge/detail";
    }
}

