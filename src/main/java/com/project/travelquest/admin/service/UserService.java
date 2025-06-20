package com.project.travelquest.admin.service;

import com.project.travelquest.admin.dao.UserDAO;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDAO userDAO;

    public List<UserVO> getAllUsers() {
        return userDAO.selectAllUsers();
    }
}
