package com.project.travelquest.map.service;

import com.project.travelquest.map.mapper.PlaceDetailMapper;
import com.project.travelquest.map.dto.PlaceDetail;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class PlaceDetailService {
    private final PlaceDetailMapper mapper;

    public PlaceDetailService(PlaceDetailMapper mapper) {
        this.mapper = mapper;
    }

    public PlaceDetail getTourPlace(Long contentId) throws SQLException {
        return mapper.findByContentId(contentId);
    }
}

