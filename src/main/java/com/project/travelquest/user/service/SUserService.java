package com.project.travelquest.user.service;

import com.project.travelquest.user.dao.SUserDAO;
import com.project.travelquest.user.util.PasswordValidator;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SUserService {

    @Autowired
    private SUserDAO SUserDao;

    // DB에서 이메일 중복 확인
    public boolean existsByEmail(String user_email) {
        return SUserDao.existsByEmail(user_email) > 0;
    }

    // 회원가입 저장 로직
    public void saveUser(UserVO user) {
        //DB에 저장
        SUserDao.saveUser(user);
    }

    // 이메일 찾기 로직
    public UserVO getUserByUsername(String user_name) {
        return SUserDao.findByUsername(user_name);
    }

    public String validateAndSaveUser(UserVO user) {
        // 비밀번호 일치 여부 확인
        if (!PasswordValidator.isValid(user.getUser_password(), user.getPassword_check())) {
            return "비밀번호가 일치하지 않습니다.";
        }

        // 이메일 중복 확인
        if (existsByEmail(user.getUser_email())) {
            return "이미 존재하는 이메일입니다.";
        }

        // 비밀번호 저장
        saveUser(user);
        return null; //null이면 성공이라는 의미
    }
}