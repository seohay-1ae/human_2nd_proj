package com.project.travelquest.comu.vo;

import lombok.Data;

import java.sql.Date;

@Data
public class RegisterPlaceVO {

    private int id;
    private String title;
    private String writer;
    private String address;
    private String description;
    private String imageUrl;
    private Date createdAt;
    private String status; // 상태: 대기 / 승인 / 거절

}
