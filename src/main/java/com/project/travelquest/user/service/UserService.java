package com.project.travelquest.user.service;

import com.project.travelquest.user.dao.UserDAO;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDAO userDao;

    //이메일 중복 확인
    public boolean existsByEmail(String email) {
        return userDao.existsByEmail(email) > 0;
    }

    // 회원가입 저장 로직
    public void saveUser(UserVO user) {

        //DB에 저장
        userDao.saveUser(user);
    }
}
