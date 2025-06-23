package com.project.travelquest.comu.controller;

import com.project.travelquest.comu.vo.RegisterPlaceVO;
import com.project.travelquest.comu.service.ComuService;
import com.project.travelquest.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Controller
public class RegisterController {

    @Autowired
    private ComuService comuService;



    // 명소 신청 저장 + 이미지 업로드
    @PostMapping("/community/registerPlace")
    public String registerPlace(@ModelAttribute RegisterPlaceVO vo,
                                @RequestParam("imageFile") MultipartFile imageFile,
                                HttpSession session) throws Exception {
        // 파일 저장 경로
        String uploadDir = new File("src/main/resources/static/upload/").getAbsolutePath() + File.separator;

        if (!imageFile.isEmpty()) {
            String filename = imageFile.getOriginalFilename();
            imageFile.transferTo(new File(uploadDir + filename));
            vo.setImageUrl(filename);
        }

        // 세션에서 로그인 유저 정보 꺼내기
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        if (loginUser != null) {
            vo.setWriter(loginUser.getUser_name());  // 또는 loginUser.getUser_email() 등 상황에 맞게 선택
        } else {
            vo.setWriter("guest"); // 또는 예외 처리 및 로그인 페이지로 리다이렉트
        }

        comuService.insertRegisterPlace(vo);

        return "redirect:/community/registerPlace?success";
    }

}

