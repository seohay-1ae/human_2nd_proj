package com.project.travelquest.user.service;

import com.project.travelquest.user.dao.UserDAO;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

@Service("VerifyService")
public class VerifyService {
    private final Map<String, String> codeMap = new ConcurrentHashMap<>();

    @Autowired
    UserDAO userDAO;

    @Autowired
    JavaMailSender mailSender;

    // 인증번호 생성 + 전송
    public String generateAndSendCode(String email) {
        String code = String.format("%06d", new Random().nextInt(999999));

        //  DB에 저장
        UserVO userVO = new UserVO();
        userVO.setUser_email(email);
        userVO.setPass_auth(code);
        userDAO.updateAuthCode(userVO);

        // 이메일 전송
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("비밀번호 재설정 인증번호");
        message.setText("인증번호는 " + code + " 입니다.");
        mailSender.send(message);

        return code;
    }

    // 인증번호 검증
    public boolean checkCode(String email, String inputCode) {
        String savedCode = userDAO.getAuthCode(email);
        return (savedCode != null && savedCode.equals(inputCode)) ? success(email) : false;
    }

    //  인증 성공 시 null값 부여
    public boolean success(String email) {
        userDAO.clearAuthCode(email);
        return true;
    }
}
