package com.project.travelquest.admin.dao;

import com.project.travelquest.admin.vo.AdminUserVO;

import java.util.List;

public interface AdminUserDAO {
    List<AdminUserVO> selectAllUsers();

    //회원계정 삭제
    void deleteUser(long userId);
}
