package com.project.travelquest.user.service;

import com.project.travelquest.user.dao.UserDAO;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDAO userDao;

//    비밀번호 암호화 (관련 객체)
//    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

//     이메일 중복 확인
        public boolean existsByEmail(String email) {
        return userDao.existsByEmail(email) > 0;
    }

    // 회원가입 저장 로직 (암호화 포함)
    public void saveUser(UserVO user) {

        // 1. 비밀번호 암호화
//        String encodedPassword = passwordEncoder.encode(user.getPassword());
//        user.setPassword(encodedPassword);

        // 2. DB에 저장
        userDao.saveUser(user);
    }
}
