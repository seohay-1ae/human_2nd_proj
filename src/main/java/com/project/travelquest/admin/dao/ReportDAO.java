package com.project.travelquest.admin.dao;

import com.project.travelquest.admin.vo.ReportVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReportDAO {

    // 신고 처리
    int insertReport(@Param("postId") int postId, @Param("reporterId") String reporterId);

    int isAlreadyReported(@Param("postId") int postId, @Param("reporterId") String reporterId);


    List<ReportVO> getReportList();

}