package com.project.travelquest.admin.dao;

import com.project.travelquest.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminDAO {
    public List<UserVO> selectAllUsersList();
}
