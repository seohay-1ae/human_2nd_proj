package com.project.travelquest.map.service;

import com.project.travelquest.map.model.Location;
import org.apache.ibatis.annotations.Param;

public interface PlaceBadgeService {
    Location getBadgeImgbyContentId(@Param("contentId") String contentId);
}
