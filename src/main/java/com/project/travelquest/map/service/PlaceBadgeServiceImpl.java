package com.project.travelquest.map.service;

import com.project.travelquest.map.mapper.LocationMapper;
import com.project.travelquest.map.model.Location;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlaceBadgeServiceImpl implements PlaceBadgeService {
    private final LocationMapper locationMapper;

    @Autowired
    public PlaceBadgeServiceImpl(LocationMapper locationMapper) {
        this.locationMapper = locationMapper;
    }

    @Override
    public Location getBadgeImgbyContentId(int contentId) {
        Location location = locationMapper.getBadgeImgbyContentId(contentId);
        System.out.println("DB 조회된 badgeImgPath: " + location.getBadgeImgPath());
        return location;
    }
}

