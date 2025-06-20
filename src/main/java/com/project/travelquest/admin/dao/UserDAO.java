package com.project.travelquest.admin.dao;

import com.project.travelquest.user.vo.UserVO;

import java.util.List;

public interface UserDAO {
    List<UserVO> selectAllUsers();
}
