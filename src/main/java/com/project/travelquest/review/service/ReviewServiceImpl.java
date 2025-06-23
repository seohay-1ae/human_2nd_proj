package com.project.travelquest.review.service;

import com.project.travelquest.review.dto.ReviewDTO;
import com.project.travelquest.review.mapper.ReviewMapper;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    private final ReviewMapper reviewMapper;  // MyBatis 매퍼 (또는 JPA Repository)

    public ReviewServiceImpl(ReviewMapper reviewMapper) {
        this.reviewMapper = reviewMapper;
    }

    @Override
    public List<ReviewDTO> getReviewsByContentId(Long contentId) {
        return reviewMapper.findByContentId(contentId);
    }

    @Override
    public ReviewDTO saveReview(ReviewDTO reviewDTO) {
        reviewMapper.insert(reviewDTO);
        return reviewDTO;
    }

    @Override
    public ReviewDTO updateReview(ReviewDTO reviewDTO) {
        reviewMapper.update(reviewDTO);
        return reviewDTO;
    }

    @Override
    public void deleteReview(Long reviewId) {
        reviewMapper.delete(reviewId);
    }
}

