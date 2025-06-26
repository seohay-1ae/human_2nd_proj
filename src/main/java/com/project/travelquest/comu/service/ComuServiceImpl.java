package com.project.travelquest.comu.service;

import com.project.travelquest.comu.dao.ComuDAO;
import com.project.travelquest.comu.dao.HeartDAO;
import com.project.travelquest.admin.dao.ReportDAO;
import com.project.travelquest.comu.vo.ComuVO;
import com.project.travelquest.comu.vo.RegisterPlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ComuServiceImpl implements ComuService {


    @Autowired
    private ReportDAO reportDAO; // ← 여기 추가


    @Autowired
    private ComuDAO comuDAO;

    @Autowired
    private HeartDAO heartDAO;

    @Override
    public List<ComuVO> getPostList() {
        return comuDAO.getPostList();
    }

    @Override
    public ComuVO getPostDetail(int id) {
        return comuDAO.getPostDetail(id);
    }

    @Override
    public void insertPost(ComuVO post) {
        comuDAO.insertPost(post);
    }

    @Override
    public boolean toggleHeart(int postId, String userId) {
        if (heartDAO.exists(postId, userId)) {
            heartDAO.delete(postId, userId);
            comuDAO.decreaseHeartCount(postId);
            return false;
        } else {
            heartDAO.insert(postId, userId);
            comuDAO.increaseHeartCount(postId);
            return true;
        }
    }

    @Override
    public int getHeartCount(int postId) {
        return heartDAO.count(postId);
    }

    @Override
    public boolean isPostLikedByUser(int postId, String userId) {
        return heartDAO.exists(postId, userId);
    }

    @Override
    public boolean insertReport(int postId, String reporterId) {
        // 이미 신고한 경우 true 반환 (ReportDAO 사용)
        if (reportDAO.isAlreadyReported(postId, reporterId) > 0) {
            return true;
        }

        // 신고 저장 (ReportDAO 사용)
        reportDAO.insertReport(postId, reporterId);

        // 신고 수 증가 (이건 게시글이니까 ComuDAO 사용 맞음)
        comuDAO.increaseReportCount(postId);

        return false;
    }

    @Override
    public void deletePostAndReports(int postId) {
        heartDAO.deleteByPostId(postId);            // 1. 좋아요 먼저 삭제
        reportDAO.deleteReportsByPostId(postId);    // 2. 신고 삭제
        comuDAO.deletePost(postId);                 // 3. 게시글 삭제
    }



    @Override
    public int insertRegisterPlace(RegisterPlaceVO vo) {
        return comuDAO.insertRegisterPlace(vo);
    }


    @Override
    public List<RegisterPlaceVO> selectRegisterPlaceList() {
        return comuDAO.selectRegisterPlaceList();
    }

    @Override
    public List<ComuVO> selectMyHeartPosts(String userId) {
        return comuDAO.selectMyHeartPosts(userId);
    }

    @Override
    public List<ComuVO> selectMyPosts(String userId) {return comuDAO.selectMyPosts(userId);}

    @Override
    public List<ComuVO> getPostListWithAvatars() {
        return comuDAO.getPostListWithAvatars(); // ✅ 올바른 방식
    }
    @Override
    public List<RegisterPlaceVO> selectMyRegisterPlaces(String writer) {
        return comuDAO.selectMyRegisterPlaces(writer);
    }

}
