package com.project.travelquest.comu.service;

import com.project.travelquest.comu.vo.ComuVO;
import com.project.travelquest.comu.vo.RegisterPlaceVO;

import java.util.List;

public interface ComuService {
    List<ComuVO> getPostList();          // 전체 글 목록
    ComuVO getPostDetail(int id);        // 특정 글 상세 보기
    void insertPost(ComuVO post);        // 새 글 작성
    boolean toggleHeart(int postId, String userId);
    int getHeartCount(int postId);
    boolean isPostLikedByUser(int postId, String userId);
    boolean insertReport(int postId, String reporterId);
    void deletePostAndReports(int postId);
    int insertRegisterPlace(RegisterPlaceVO vo);
    List<RegisterPlaceVO> selectRegisterPlaceList();
    List<ComuVO> selectMyHeartPosts(String userId);

    List<ComuVO> selectMyPosts(String userId);
    // 🔥 아바타 포함 글 목록 조회 (추가)
    List<ComuVO> getPostListWithAvatars();
}