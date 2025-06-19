package com.project.travelquest.user.service;

import com.project.travelquest.user.dao.UserDAO;
import com.project.travelquest.user.util.PasswordValidator;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDAO userDao;

    //DB에서 이메일 중복 확인
    public boolean existsByEmail(String email) {
        return userDao.existsByEmail(email) > 0;
    }

    // 회원가입 저장 로직
    public void saveUser(UserVO user) {

        //DB에 저장
        userDao.saveUser(user);
    }

    public String validateAndSaveUser(UserVO user) {
        //비밀번호 일치 여부 확인
        if (!PasswordValidator.isValid(user.getPassword(), user.getPassword_check())) {
            return "비밀번호가 일치하지 않습니다.";
        }

        //이메일 중복 확인
        if (existsByEmail(user.getEmail())) {
            return "이미 존재하는 이메일입니다.";
        }

        // 비밀번호 저장
        saveUser(user);
        return null; //null이면 성공이라는 의미
    }
}