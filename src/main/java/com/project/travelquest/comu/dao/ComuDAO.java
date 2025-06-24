package com.project.travelquest.comu.dao;

import com.project.travelquest.comu.vo.ComuVO;
import com.project.travelquest.comu.vo.RegisterPlaceVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

@Mapper
public interface ComuDAO {
    List<ComuVO> getPostList() throws DataAccessException;
    ComuVO getPostDetail(int id) throws DataAccessException;
    void insertPost(ComuVO post) throws DataAccessException;
    void increaseHeartCount(@Param("postId") int postId);
    void decreaseHeartCount(@Param("postId") int postId);
    void increaseReportCount(@Param("postId") int postId);
    void deletePost(int postId);
    void deleteReportsByPostId(int postId);
    int insertRegisterPlace(RegisterPlaceVO vo);
    List<RegisterPlaceVO> selectRegisterPlaceList();
}