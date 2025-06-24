package com.project.travelquest.admin.vo;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeVO {
    private int noticeId;
    private String title;
    private String content;
    private Date regDate;

}
