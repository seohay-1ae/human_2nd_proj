package com.project.travelquest.map.service;

import com.project.travelquest.map.model.TourPlace;
import com.project.travelquest.map.repository.PlaceListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceListService {
    @Autowired
    private RegionCodeService regionCodeService;

    @Autowired
    private PlaceListRepository placeListRepository;

    public List<TourPlace> getPlacesByRegionAndSubregion(String region, String subregion) {
        Integer areacode = regionCodeService.getAreacodeByRegionName(region);
        System.out.println("region:"+region);
        if (areacode == null) {
            throw new RuntimeException("해당 지역을 찾을 수 없습니다.");
        }
        Integer sigungucode = regionCodeService.getSigungucodeBySubregionName(subregion);
        System.out.println("subregion:"+subregion);
        if (sigungucode == null) {
            throw new RuntimeException("해당 세부지역을 찾을 수 없습니다.");
        }
        return List.of();
    }

}
