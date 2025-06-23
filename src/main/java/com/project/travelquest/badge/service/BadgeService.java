package com.project.travelquest.badge.service;

import com.project.travelquest.badge.mapper.BadgeMapper;
import com.project.travelquest.badge.model.BadgeDTO;
import com.project.travelquest.map.model.Location;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BadgeService {

    @Autowired
    private BadgeMapper badgeMapper;

    // 유저 전체 뱃지 조회
    public List<BadgeDTO> getBadgesByUserId(Long userId) {
        return badgeMapper.selectBadgesByUserId(userId);
    }

    // 상세 뱃지 1개 조회
    public BadgeDTO getBadgeDetail(Long userId, Long badgeId) {
        return badgeMapper.selectBadgeDetail(userId, badgeId);
    }
}