package com.project.travelquest.map.controller;

import com.project.travelquest.map.model.TourPlace;
import com.project.travelquest.map.service.PlaceListService;
//import com.project.travelquest.utils.RegionNameMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/region")
public class PlaceListController {

    @Autowired
    private PlaceListService placeListService;

    @GetMapping("/{region}/{subregion}")
    public String placeList(
            @PathVariable String region,
            @PathVariable String subregion,
            Model model) {

        List<TourPlace> placeList = placeListService.getPlacesByRegionAndSubregion(region, subregion);

        // 한글 지역명 매핑
//        String regionKr = RegionNameMapper.getRegionKr(region);
//        String subregionKr = RegionNameMapper.getSubregionKr(region, subregion);

        // 모델에 값 추가
        model.addAttribute("placeList", placeList);
        model.addAttribute("region", region);               // 영문
        model.addAttribute("subregion", subregion);         // 영문
//        model.addAttribute("regionKr", regionKr);           // 한글
//        model.addAttribute("subregionKr", subregionKr);     // 한글

        return "map/placeList";  // JSP 경로: /WEB-INF/views/map/placeList.jsp
    }
}
