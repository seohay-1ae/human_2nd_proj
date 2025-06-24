package com.project.travelquest.admin.vo;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class ReportVO {

    private String reporterId;
    private int postId;
    private Date createdAt;
    private String content;
    private int reportCount;

}
