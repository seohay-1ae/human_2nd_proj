package com.project.travelquest.comu.dao;

import com.project.travelquest.comu.vo.ComuCommentVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 댓글 관련 DB 인터페이스 (MyBatis 매퍼용)
 */
@Mapper
public interface ComuCommentDAO {

    // 댓글 등록
    void insertComment(ComuCommentVO comment);

    // 게시글별 댓글 전체 조회
    List<ComuCommentVO> getCommentListByPostId(int postId);

    // 방금 등록된 최신 댓글 1개 조회 (Ajax 응답용)
    ComuCommentVO getLatestCommentByPostId(int postId);

    void updateCommentCount(int postId);
}
