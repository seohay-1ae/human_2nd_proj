package com.project.travelquest.comu.service;

import com.project.travelquest.comu.vo.ComuCommentVO;

import java.util.List;

/**
 * 댓글 서비스 인터페이스
 * - 컨트롤러와 DAO를 연결하는 중간 계층
 */
public interface ComuCommentService {

    // 특정 게시글의 전체 댓글 조회
    List<ComuCommentVO> getCommentListByPostId(int postId);

    // 댓글 등록
    void insertComment(ComuCommentVO comment);

    // 방금 등록된 최신 댓글 조회 (Ajax 응답용)
    ComuCommentVO getLatestCommentByPostId(int postId);
}
