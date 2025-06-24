package com.project.travelquest.comu.controller;

import com.project.travelquest.admin.service.NoticeService;
import com.project.travelquest.admin.vo.NoticeVO;
import com.project.travelquest.comu.service.ComuService;
import com.project.travelquest.comu.service.ComuCommentService;
import com.project.travelquest.comu.vo.ComuVO;
import com.project.travelquest.comu.vo.ComuCommentVO;
import com.project.travelquest.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class ComuController {

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private ComuService comuService;

    @Autowired
    private ComuCommentService comuCommentService;

    // 커뮤니티 목록 페이지 (글 목록 + 각 글의 댓글 포함)
    @GetMapping("/community")
    public String showCommunityPage(Model model, HttpSession session) {
        // 로그인 유저 가져오기
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        String userId = (loginUser != null) ? String.valueOf(loginUser.getUser_id()) : "guest";

        List<ComuVO> postList = comuService.getPostList();

        for (ComuVO post : postList) {
            int postId = post.getPostId();

            // 해당 게시글의 댓글
            List<ComuCommentVO> comments = comuCommentService.getCommentListByPostId(postId);
            post.setComments(comments);

            // 하트를 눌렀는지 여부 설정
            boolean liked = comuService.isPostLikedByUser(postId, userId);
            post.setLikedByUser(liked);
        }

        model.addAttribute("posts", postList);
        return "community/board";
    }

    // 글쓰기 폼
    @GetMapping("/community/write")
    public String showWritePage(HttpSession session, Model model) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        String userName = (loginUser != null) ? loginUser.getUser_name() : "guest";
        model.addAttribute("userName", userName);
        return "community/write";
    }

    // 글 등록 처리
    @PostMapping("/community/write")
    public String insertPost(@ModelAttribute ComuVO post, HttpSession session) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            // 로그인 안 한 사용자는 글 작성 불가
            return "redirect:/login";
        }

        // 작성자 정보 설정
        post.setWriter(loginUser.getUser_name());  // ComuVO에 user_id가 있다고 가정

        comuService.insertPost(post);
        return "redirect:/community";
    }

    // 글 상세보기 (선택)
    @GetMapping("/community/detail")
    public String showPostDetail(@RequestParam("id") int id, Model model) {
        ComuVO post = comuService.getPostDetail(id);
        List<ComuCommentVO> comments = comuCommentService.getCommentListByPostId(id);
        post.setComments(comments);
        model.addAttribute("post", post);
        return "community/detail";
    }


    @GetMapping("/community/registerPlace")
    public String showRegisterPlace() {
        return "community/registerPlace";
    }

    @GetMapping("/community/notice")
    public String showNoticeOnCommunity(Model model) {
        List<NoticeVO> list = noticeService.getNoticeList();
        model.addAttribute("list", list);
        return "community/notice"; // community 폴더에 있는 notice.jsp
    }

    @GetMapping("/community/notice/{id}")
    public String showCommunityNoticeDetail(@PathVariable("id") int id,
                                            @RequestParam(value = "source", required = false) String source,
                                            Model model) {
        NoticeVO notice = noticeService.getNoticeById(id);
        model.addAttribute("notice", notice);
        model.addAttribute("source", source);
        return "community/noticedetail"; // community 폴더 안에 noticedetail.jsp 있어야 함
    }

    @PostMapping("/community/report")
    @ResponseBody
    public String reportPost(@RequestBody Map<String, Object> data, HttpSession session) {
        int postId = Integer.parseInt(data.get("postId").toString());

        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        String reporterId;

        if (loginUser != null) {
            reporterId = String.valueOf(loginUser.getUser_id());
        } else {
            reporterId = "guest"; // 또는 null 처리
        }

        boolean already = comuService.insertReport(postId, reporterId);
        return already ? "이미 신고한 게시글입니다." : "신고가 접수되었습니다.";
    }

    @GetMapping("/likedPost")
    public String likedPostPage(HttpSession session, Model model) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            // 로그인 페이지로 리다이렉트 또는 에러 처리
            return "redirect:/user/login"; // 혹은 "redirect:/login"
        }
        String userId = loginUser.getUser_id().toString();
        List<ComuVO> heartList = comuService.selectMyHeartPosts(userId);
        model.addAttribute("heartList", heartList);
        return "mypage/likedPost";
    }
}
