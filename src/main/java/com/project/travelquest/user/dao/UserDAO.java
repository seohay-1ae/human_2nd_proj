package com.project.travelquest.user.dao;

import com.project.travelquest.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserDAO {
    // 이메일 중복 검사 (파라미터 이름 명시적으로 지정)
    int existsByEmail(@Param("email") String email);

    // 회원 저장
    void saveUser(UserVO user);

}