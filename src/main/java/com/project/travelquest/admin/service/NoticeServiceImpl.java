package com.project.travelquest.admin.service;

import com.project.travelquest.admin.dao.NoticeDAO;
import com.project.travelquest.admin.dao.ReportDAO;
import com.project.travelquest.admin.vo.NoticeVO;
import com.project.travelquest.admin.vo.ReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeDAO noticeDAO;

    @Autowired
    private ReportDAO reportDAO;


    @Override
    public List<NoticeVO> getNoticeList() {
        return noticeDAO.getNoticeList();
    }

    @Override
    public NoticeVO getNoticeById(int id) {
        return noticeDAO.getNoticeById(id); //상세보기
    }

    @Override
    public void insertNotice(NoticeVO notice) {
        noticeDAO.insertNotice(notice);
    }

    @Override
    public void updateNotice(NoticeVO notice) {
        noticeDAO.updateNotice(notice);
    }

    @Override
    public void deleteNotice(int noticeId) {
        noticeDAO.deleteNotice(noticeId);
    }

    @Override
    public List<ReportVO> getReportList() {
        return reportDAO.getReportList();
    }

//    @Override
//    public List<RegistPlaceVO> getRegistPlaceList() {
//        return noticeDAO.getRegistPlaceList();
//    }
}
