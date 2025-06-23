package com.project.travelquest.user.dao;

import com.project.travelquest.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

@Mapper
public interface UserDAO {

    UserVO login(UserVO userVO);

    public List<UserVO> selectAllUsersList() throws DataAccessException;

    void updateUserProfileText(@Param("userId") Long userId,
                               @Param("profileText") String profileText);  // 소개글 수정

    UserVO getUserById(Long userId);                              // ID로 유저 정보 조회
}
