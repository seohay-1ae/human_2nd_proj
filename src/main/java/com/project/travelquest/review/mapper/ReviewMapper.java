package com.project.travelquest.review.mapper;

import com.project.travelquest.review.dto.ReviewDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReviewMapper {

    // 특정 관광지(contentId)의 모든 리뷰 가져오기
    List<ReviewDTO> findByContentId(@Param("contentId") Long contentId);

    // 리뷰 등록
    int insert(ReviewDTO reviewDto);

    // 리뷰 수정
    int update(ReviewDTO reviewDto);

    // 리뷰 삭제
    int delete(@Param("reviewId") Long reviewId);
}

