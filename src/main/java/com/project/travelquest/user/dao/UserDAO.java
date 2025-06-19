package com.project.travelquest.user.dao;

import com.project.travelquest.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import java.util.List;

@Mapper
public interface UserDAO {

    UserVO login(UserVO userVO);
    public List<UserVO> selectAllUsersList() throws DataAccessException;
}
