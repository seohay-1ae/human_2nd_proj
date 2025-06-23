package com.project.travelquest.user.service;

import com.project.travelquest.user.dao.UserDAO;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("UserService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserService {

    @Autowired
    UserDAO userDAO;

    public UserVO login(UserVO userVO) {
        return userDAO.login(userVO);
    }

    public List<UserVO> listUsers() throws Exception {
        return userDAO.selectAllUsersList();
    }

    public void updateUserProfileText(Long userId, String profileText) {
        userDAO.updateUserProfileText(userId, profileText);
    }

    public UserVO getUserById(Long userId) {
        return userDAO.getUserById(userId);
    }
}