package com.project.travelquest.review.controller;

import com.project.travelquest.review.dto.ReviewDTO;
import com.project.travelquest.review.service.ReviewService;
import com.project.travelquest.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/api/reviews")
public class ReviewController {

    private final ReviewService reviewService; // 서비스 계층 (DAO 포함)

    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    // 1) 특정 content_id 리뷰 목록 조회
    @GetMapping
    public List<ReviewDTO> getReviews(@RequestParam("contentId") Long contentId) {
        return reviewService.getReviewsByContentId(contentId);
    }

    // 2) 리뷰 등록
    @PostMapping
    public ReviewDTO createReview(@RequestBody ReviewDTO reviewDTO, HttpSession session) {
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "로그인 후 이용해주세요.");
        }
        reviewDTO.setUserId(loginUser.getUser_id());
        return reviewService.saveReview(reviewDTO);
    }

    // 3) 리뷰 수정
    @PutMapping("/{reviewId}")
    public ReviewDTO updateReview(@PathVariable Long reviewId, @RequestBody ReviewDTO reviewDTO) {
        reviewDTO.setReviewId(reviewId);
        return reviewService.updateReview(reviewDTO);
    }

    // 4) 리뷰 삭제
    @DeleteMapping("/{reviewId}")
    public void deleteReview(@PathVariable Long reviewId) {
        reviewService.deleteReview(reviewId);
    }
}

