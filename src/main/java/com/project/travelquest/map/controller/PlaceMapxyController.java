package com.project.travelquest.map.controller;

import com.project.travelquest.map.mapper.LocationMapper;
import com.project.travelquest.map.model.Location;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class PlaceMapxyController {

    private final LocationMapper locationMapper;

    public PlaceMapxyController(LocationMapper locationMapper) {
        this.locationMapper = locationMapper;
    }

    @GetMapping("/place/location")
    public Map<String, Object> getPlaceLocation(@RequestParam("contentid") int contentId) {
        Location location = locationMapper.getLocationById((long) contentId);  // 오타 수정 및 형변환
        Map<String, Object> map = new HashMap<>();
        map.put("mapx", location.getMapx());
        map.put("mapy", location.getMapy());
        return map;
    }
}