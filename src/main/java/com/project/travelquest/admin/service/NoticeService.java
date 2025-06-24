package com.project.travelquest.admin.service;

import com.project.travelquest.admin.vo.NoticeVO;
import com.project.travelquest.admin.vo.ReportVO;

import java.util.List;

public interface NoticeService {

    List<NoticeVO> getNoticeList();
    NoticeVO getNoticeById(int id);
    void insertNotice(NoticeVO notice);
    void updateNotice(NoticeVO notice);
    void deleteNotice(int id);
    List<ReportVO> getReportList();

//    List<RegistPlaceVO> getRegistPlaceList();
}
