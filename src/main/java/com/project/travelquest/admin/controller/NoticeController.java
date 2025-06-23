package com.project.travelquest.admin.controller;

import com.project.travelquest.admin.service.NoticeService;
import com.project.travelquest.admin.vo.NoticeVO;
import com.project.travelquest.admin.vo.ReportVO;
import com.project.travelquest.comu.service.ComuService;
import com.project.travelquest.comu.vo.RegisterPlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {
    // --- 아래부터 notice 관련 ---
    @Autowired
    private NoticeService noticeService;

    @Autowired
    private ComuService comuService;

    // 🔄 콤보박스로 전환되는 전체 JSP 대응
    @GetMapping
    public String getPageByType(@RequestParam(defaultValue = "notices") String type, Model model) {
        model.addAttribute("type", type); // 현재 선택 유지용

        switch (type) {
            case "notices":
                List<NoticeVO> noticeList = noticeService.getNoticeList();
                model.addAttribute("list", noticeList);
                return "admin/notice";
            case "reports":
                List<ReportVO> reportList = noticeService.getReportList();
                model.addAttribute("list", reportList);
                return "admin/report";
            case "registPlace":
                List<RegisterPlaceVO> placeList = comuService.selectRegisterPlaceList();
                model.addAttribute("list", placeList);
                return "admin/registPlace";
            default:
                return "admin/notice"; // fallback
        }
    }

    // 글쓰기 폼
    @GetMapping("/write")
    public String writeForm() {
        return "admin/noticewrite";
    }

    // 글 등록
    @PostMapping("/write")
    public String insertNotice(NoticeVO notice) {
        noticeService.insertNotice(notice);
        return "redirect:/admin/notice?type=notices";
    }

    // 상세 보기
    @GetMapping("/{id}")
    public String getNoticeDetail(@PathVariable("id") int id, Model model) {
        NoticeVO notice = noticeService.getNoticeById(id);
        model.addAttribute("notice", notice);
        return "community/noticedetail";
    }

    @PostMapping("/deleteNotice")
    public String deleteNotice(@RequestParam("noticeId") int noticeId) {
        noticeService.deleteNotice(noticeId);  // 서비스 → DAO 호출
        return "redirect:/admin/notice";       // 삭제 후 리스트로 이동
    }

    @PostMapping("/deleteReportedPost")
    public String deleteReportedPost(@RequestParam("postId") int postId) {
        comuService.deletePostAndReports(postId);
        return "redirect:/admin/notice?type=reports";
    }
}

