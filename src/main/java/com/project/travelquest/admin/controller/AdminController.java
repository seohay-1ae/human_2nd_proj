package com.project.travelquest.admin.controller;

import com.project.travelquest.admin.service.AdminUserService;
import com.project.travelquest.admin.vo.AdminUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminUserService adminUserService;

    //회원계정 맵핑(사용자 관리)
    @GetMapping("/adminPage")
    public String showAdminPage(Model model) {
        List<AdminUserVO> userList = adminUserService.getAllUsers();
        model.addAttribute("userList", userList); // JSP로 전달
        return "admin/adminPage"; // adminPage.jsp
    }

    //회원계정 삭제 기능
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("userId") Long userId) {
        adminUserService.deleteUserById(userId);
        return "redirect:/admin/adminPage";
    }

    //회원계정 맵핑(여행지역 관리)
    @GetMapping("/adminTravelPage")
    public String showAdminTravelPage() {
        return "admin/adminTravelPage"; // adminTravelPage.jsp
    }

    //회원계정 맵핑(커뮤니티 관리)
    @GetMapping("/adminCommunityPage")
    public String showCommunityPage() {
        return "admin/adminCommunityPage"; // adminCommunityPage.jsp
    }

    //회원계정 맵핑(뱃지 관리)
    @GetMapping("/adminBadgePage")
    public String showAdminBadgePage() {
        return "admin/adminBadge"; // adminBadge.jsp
    }

    // --- 아래부터 notice 관련 ---

    // 콤보박스에 따른 전체 notice 페이지 (notices, reports, registPlace)
//    @GetMapping("/notice")
//    public String getPageByType(@RequestParam(defaultValue = "notices") String type, Model model) {
//        model.addAttribute("type", type);
//
//        switch (type) {
//            case "notices":
//                List<NoticeVO> noticeList = noticeService.getNoticeList();
//                model.addAttribute("list", noticeList);
//                return "admin/notice";
//            case "reports":
//                List<ReportVO> reportList = noticeService.getReportList();
//                model.addAttribute("list", reportList);
//                return "admin/report";
//            case "registPlace":
//                List<RegisterPlaceVO> placeList = comuService.selectRegisterPlaceList();
//                model.addAttribute("list", placeList);
//                return "admin/registPlace";
//            default:
//                return "admin/notice";
//        }
//    }
//
//    // 글쓰기 폼
//    @GetMapping("/notice/write")
//    public String writeForm() {
//        return "admin/noticewrite";
//    }
//
//    // 글 등록
//    @PostMapping("/notice/write")
//    public String insertNotice(NoticeVO notice) {
//        noticeService.insertNotice(notice);
//        return "redirect:/admin/notice?type=notices";
//    }
//
//    // 상세 보기
//    @GetMapping("/notice/{id}")
//    public String getNoticeDetail(@PathVariable("id") int id, Model model) {
//        NoticeVO notice = noticeService.getNoticeById(id);
//        model.addAttribute("notice", notice);
//        return "community/noticedetail";
//    }
//
//    // 공지 삭제
//    @PostMapping("/notice/deleteNotice")
//    public String deleteNotice(@RequestParam("noticeId") int noticeId) {
//        noticeService.deleteNotice(noticeId);
//        return "redirect:/admin/notice";
//    }
//
//    // 신고 게시글 삭제
//    @PostMapping("/notice/deleteReportedPost")
//    public String deleteReportedPost(@RequestParam("postId") int postId) {
//        comuService.deletePostAndReports(postId);
//        return "redirect:/admin/notice?type=reports";
//    }
}
