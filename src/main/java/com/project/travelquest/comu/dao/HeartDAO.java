package com.project.travelquest.comu.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HeartDAO {



    boolean exists(@Param("postId") int postId, @Param("userId") String userId);   // 좋아요 눌렀는지 확인
    void insert(@Param("postId") int postId, @Param("userId") String userId);       // 좋아요 추가
    void delete(@Param("postId") int postId, @Param("userId") String userId);       // 좋아요 제거
    int count(@Param("postId") int postId);

}