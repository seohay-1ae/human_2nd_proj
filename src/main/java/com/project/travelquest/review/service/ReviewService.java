package com.project.travelquest.review.service;

import com.project.travelquest.review.dto.ReviewDTO;

import java.util.List;

public interface ReviewService {
    List<ReviewDTO> getReviewsByContentId(Long contentId);
    ReviewDTO saveReview(ReviewDTO reviewDto);
    ReviewDTO updateReview(ReviewDTO reviewDto);
    void deleteReview(Long reviewId);
}
