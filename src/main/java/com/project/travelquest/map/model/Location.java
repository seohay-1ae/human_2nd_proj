package com.project.travelquest.map.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Location {
    private Long contentid;
    private String title;
    private String addr1;
    private double mapx;
    private double mapy;
    private String firstimage;
}
