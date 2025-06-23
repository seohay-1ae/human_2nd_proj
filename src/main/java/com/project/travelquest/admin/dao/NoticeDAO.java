package com.project.travelquest.admin.dao;

import com.project.travelquest.admin.vo.NoticeVO;
import com.project.travelquest.admin.vo.ReportVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeDAO {
    List<NoticeVO> getNoticeList();
    NoticeVO getNoticeById(int id);
    void insertNotice(NoticeVO notice);
    void updateNotice(NoticeVO notice);
    void deleteNotice(int noticeId);


//    List<ReportVO> getReportList();
}