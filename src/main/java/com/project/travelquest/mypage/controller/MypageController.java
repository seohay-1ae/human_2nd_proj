package com.project.travelquest.mypage.controller;

import com.project.travelquest.avatar.service.MyAvatarService;
import com.project.travelquest.user.service.UserService;
import com.project.travelquest.user.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
public class MypageController {

    @Autowired
    UserService userService;
    @Autowired
    MyAvatarService myAvatarService;

    // 로그인하기 / 이메일로 가입하기 선택하는 페이지
    @RequestMapping("/loginSelect")
    public String loginSelect() {
        return "mypage/loginSelect";
    }

    // 이메일로 가입하기
    @RequestMapping("/signUp")
    public String joinForm() {
        return "mypage/signUp";
    }

    // 마이페이지
    @RequestMapping("/mypage") // mypage/index.jsp
    public String mypage(HttpSession session, Model model) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/loginSelect";
        }

        // 최신 DB 값으로 갱신해서 뿌리고 싶다면 아래 사용
        UserVO fullUserInfo = userService.getUserById(loginUser.getUser_id());
        model.addAttribute("loginUser", fullUserInfo);

        // 아바타 경로 정보 가져오기 (서비스/DAO 구현 필요)
        Map<String, String> avatarPaths = myAvatarService.getAvatarPathsByEmail(loginUser.getUser_email());
        model.addAttribute("avatarPaths", avatarPaths);

        return "mypage/index";
    }

    // 로그인하기
    @RequestMapping("/login")
    public String login() {
        return "mypage/loginForm";
    }

    //소개글 설정
    @RequestMapping("/introduction")
    public String introduction(HttpSession session, Model model) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }

        // 최신 DB 값으로 갱신해서 뿌리고 싶다면 아래 사용
        UserVO fullUserInfo = userService.getUserById(loginUser.getUser_id());
        model.addAttribute("loginUser", fullUserInfo);

        // 아바타 경로 정보 가져오기 (서비스/DAO 구현 필요)
        Map<String, String> avatarPaths = myAvatarService.getAvatarPathsByEmail(loginUser.getUser_email());
        model.addAttribute("avatarPaths", avatarPaths);

        return "mypage/introduction";
    }

    //소개글 저장
    @PostMapping("/introduction")
    public String saveIntroduction(@RequestParam("profileText") String profileText,
                                   HttpSession session,
                                   RedirectAttributes redirectAttributes) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }

        Long userId = loginUser.getUser_id();
        userService.updateUserProfileText(userId, profileText);

        loginUser.setUser_profile_text(profileText);
        session.setAttribute("loginUser", loginUser);

        redirectAttributes.addFlashAttribute("message", "소개글이 저장되었습니다.");
        return "redirect:/introduction";
    }

    // 약관
    @RequestMapping("/termsAndPrivacy")
    public String termsAndPrivacy() {
        return "mypage/termsAndPrivacy";
    }

    // 고객센터
    @RequestMapping("/customerCenter")
    public String customerCenter() {
        return "mypage/customerCenter";
    }

    // 내가 쓴 글
    @RequestMapping("/myPost")
    public String myPost() {
        return "mypage/myPost";
    }

    // 관심 글
    @RequestMapping("/likedPost")
    public String likedPost() {
        return "mypage/likedPost";
    }

    @PostMapping("/login")
    public String login(UserVO userVO, HttpSession session, Model model) {

        UserVO loginUser = userService.login(userVO);

        if (loginUser != null) {
            session.setAttribute("loginUser", loginUser);
            System.out.println("로그인 성공");
            return "redirect:/mypage";
        } else {
            model.addAttribute("message", "fail");
            System.out.println("로그인 실패");
            return "mypage/loginForm";
        }
    }
};
