package com.project.travelquest.admin.service;
import com.project.travelquest.admin.dao.AdminUserDAO;
import com.project.travelquest.admin.vo.AdminUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminUserService {

    @Autowired
    private AdminUserDAO adminUserDAO;

    public List<AdminUserVO> getAllUsers() {
        return adminUserDAO.selectAllUsers();
    }

    //회원계정 삭제
    public void deleteUserById(Long userId) {
        adminUserDAO.deleteUser(userId);
    }
}
