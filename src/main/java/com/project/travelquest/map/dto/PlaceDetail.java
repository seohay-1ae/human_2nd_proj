package com.project.travelquest.map.dto;

import lombok.Data;

@Data
public class PlaceDetail {

    private long contentId;
    private String addr1;
    private String addr2;
    private String createdTime;
    private String firstImage;
    private String firstImage2;
    private String modifiedTime;
    private String tel;
    private String title;
    private String homepage;
    private String overview;
    private String infoCenter;
    private String restDate;
    private String useTime;
    private String useFee;

    // Getters/Setters 생략 (필요시 자동 생성)
}
