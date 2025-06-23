package com.project.travelquest.mypage.controller;

import com.project.travelquest.avatar.service.MyAvatarService;
import com.project.travelquest.user.service.UserService;
import com.project.travelquest.user.service.VerifyService;
import com.project.travelquest.user.vo.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class MypageController {

    @Autowired
    UserService userService;

    @Autowired
    MyAvatarService myAvatarService;

    @Autowired
    VerifyService verifyService;

    // 로그인하기 / 이메일로 가입하기 선택하는 페이지
    @RequestMapping("/loginSelect")
    public String loginSelect() {
        return "mypage/loginSelect";
    }

    // 이메일로 가입하기
    @RequestMapping("/signUp")
    public String signUp() {
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

            // user_role이 '0'이면 관리자 페이지로 이동
            if ("0".equals(loginUser.getUser_role())) {
                return "redirect:/adminPage"; // 관리자 페이지 URL로 변경
            }

            return "redirect:/mypage"; // 일반 유저는 마이페이지로

        } else {
            model.addAttribute("message", "fail");
            model.addAttribute("messageType", "loginFail");
            System.out.println("로그인 실패");
            return "mypage/loginForm";
        }
    }

    // 비밀번호찾기
    @RequestMapping("/findPw")
    public String findPassword() { return "mypage/findPwForm"; }


    //  인증번호요청
    @PostMapping("/sendCode")
    @ResponseBody
    public String sendCode(String email) {
        verifyService.generateAndSendCode(email);
        return "인증번호가 전송되었습니다.";
    }

    //  인증번호확인
    @PostMapping("/verifyCode")
    @ResponseBody
    public String verifyCode(String email, String code) {
        return verifyService.checkCode(email, code) ? "인증 성공" : "인증 실패";
    }

    //  비밀번호 재설정
    @PostMapping("/resetPw")
    public String resetPw(UserVO userVO, Model model) {
        userService.updatePw(userVO);
        model.addAttribute("message", "비밀번호 변경 완료");
        model.addAttribute("messageType", "resetSuccess");
        return "mypage/loginForm";
    }
};
