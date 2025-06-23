package com.project.travelquest.map.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.project.travelquest.map.mapper.LocationMapper;
import com.project.travelquest.map.model.Location;

@RestController
@RequestMapping("/api")
public class MapApiController {

    private final LocationMapper locationMapper;

    public MapApiController(LocationMapper locationMapper) {
        this.locationMapper = locationMapper;
    }

    @GetMapping("/locations")
    public List<Location> getLocations(
            @RequestParam(required = false) String region,
            @RequestParam(required = false) String subregion) {

        return locationMapper.getLocationsByFilter(region, subregion);
    }
};
