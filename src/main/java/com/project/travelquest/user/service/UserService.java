package com.project.travelquest.user.service;

import com.project.travelquest.user.vo.UserVO;

import java.util.List;

public interface UserService {

    UserVO login(UserVO userVO);
    List<UserVO> listUsers() throws Exception;
}
