package com.project.travelquest.map.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Location {
    private String contentid;  // contentid를 String으로 처리
    private Long areacode;
    private String addr1;
    private String addr2;
    private Long createdtime;
    private String firstimage;
    private String firstimage2;
    private double mapx;
    private double mapy;
    private Long modifiedtime;
    private Long sigungucode;
    private String title;
    private String homepage;
    private String overview;
    private String opendate;
    private String infocenter;
    private String restdate;
    private String usetime;
    private String usefee;
    private String contenttypeid;
    private String areaname;
    private String sigunguname;
    private Long badgeId;

    private String badgeImgPath;  // badgeImgPath는 String으로 처리
}

