package com.project.travelquest.comu.controller;

import com.project.travelquest.admin.service.NoticeService;
import com.project.travelquest.admin.vo.NoticeVO;
import com.project.travelquest.avatar.service.MyAvatarService;
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

    @Autowired
    private MyAvatarService myAvatarService; // 아바타 서비스 주입

    // 커뮤니티 목록 페이지 (글 목록 + 각 글의 댓글 포함)
    @GetMapping("/community")
    public String showCommunityPage(Model model, HttpSession session) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        String userId = (loginUser != null) ? String.valueOf(loginUser.getUser_id()) : "guest";

        // 🟢 아바타 정보까지 포함된 게시글 목록 조회
        List<ComuVO> postList = comuService.getPostListWithAvatars();

        for (ComuVO post : postList) {
            int postId = post.getPostId();

            // 댓글 설정
            List<ComuCommentVO> comments = comuCommentService.getCommentListByPostId(postId);
            post.setComments(comments);

            // 좋아요 상태 설정
            boolean liked = comuService.isPostLikedByUser(postId, userId);
            post.setLikedByUser(liked);
        }

        // 게시글 목록에 각 게시글 작성자의 아바타가 이미 포함됨
        model.addAttribute("posts", postList);

        // 로그인한 사용자의 아바타는 별도 avatarPaths로 제공 (자기 글에만 필요하면 뷰에서 분기처리)
        if (loginUser != null) {
            Map<String, String> myAvatarPaths = myAvatarService.getAvatarPathsByEmail(loginUser.getUser_email());
            model.addAttribute("avatarPaths", myAvatarPaths);
            model.addAttribute("loginUser", loginUser);
        }

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

    @GetMapping("/myPost")
    public String myPost(HttpSession session, Model model) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            // 로그인 안 돼 있으면 로그인 페이지로 리다이렉트
            return "redirect:/user/login";
        }

        String userId = loginUser.getUser_id().toString();

        // 🔁 내가 작성한 게시글 리스트 가져오기
        List<ComuVO> myPostList = comuService.selectMyPosts(userId);

        model.addAttribute("myPostList", myPostList);

        return "mypage/myPost"; // 보여줄 JSP 경로
    }
}
