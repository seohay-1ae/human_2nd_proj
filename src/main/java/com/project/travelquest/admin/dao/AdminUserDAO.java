package com.project.travelquest.admin.dao;

import com.project.travelquest.admin.vo.AdminUserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AdminUserDAO {
    List<AdminUserVO> selectAllUsers();

    //회원계정 삭제
    void deleteUser(long userId);
}
