package com.project.travelquest.admin.service;

import com.project.travelquest.admin.dao.AdminDAO;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    AdminDAO adminDAO;

    public List<UserVO> getAllUsers() {
        return adminDAO.selectAllUsersList();
    }
}
