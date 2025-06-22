package com.project.travelquest.review.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ReviewDTO {
    private Long reviewId;
    private String contentId;
    private Long userId;
    private String userName; // 조회 시 보여주려고 추가 (선택)
    private String reviewContent;
    private String reviewImg;
    private LocalDateTime createdTime;
}

