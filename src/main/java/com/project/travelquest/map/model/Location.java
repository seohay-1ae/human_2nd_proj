package com.project.travelquest.map.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Location {
    private Long contentid;
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
}
