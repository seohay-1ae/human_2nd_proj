package com.project.travelquest.comu.service;

import com.project.travelquest.comu.dao.ComuCommentDAO;
import com.project.travelquest.comu.vo.ComuCommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComuCommentServiceImpl implements ComuCommentService {

    @Autowired
    private ComuCommentDAO comuCommentDAO;

    @Override
    public List<ComuCommentVO> getCommentListByPostId(int postId) {
        return comuCommentDAO.getCommentListByPostId(postId);
    }

    @Override
    public void insertComment(ComuCommentVO comment) {
        comuCommentDAO.insertComment(comment); // 댓글 저장
        comuCommentDAO.updateCommentCount(comment.getPostId()); // ✅ 댓글 수 DB 갱신
    }

    @Override
    public ComuCommentVO getLatestCommentByPostId(int postId) {
        return comuCommentDAO.getLatestCommentByPostId(postId);
    }
}
