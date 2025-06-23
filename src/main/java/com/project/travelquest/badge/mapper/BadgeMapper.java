package com.project.travelquest.badge.mapper;

import com.project.travelquest.badge.model.BadgeDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BadgeMapper {
    List<BadgeDTO> selectBadgesByUserId(Long userId);
    BadgeDTO selectBadgeDetail(@Param("userId") Long userId, @Param("badgeId") Long badgeId);
}