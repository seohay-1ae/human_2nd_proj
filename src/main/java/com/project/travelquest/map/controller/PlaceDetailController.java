package com.project.travelquest.map.controller;

import com.project.travelquest.map.model.Location;
import com.project.travelquest.map.mapper.LocationMapper;
import com.project.travelquest.map.service.PlaceBadgeService;
import com.project.travelquest.utils.StringUtil; // ✅ 반드시 import

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/place")
public class PlaceDetailController {

    private final LocationMapper locationMapper;
    private final PlaceBadgeService placeBadgeService;

    public PlaceDetailController(LocationMapper locationMapper, PlaceBadgeService placeBadgeService) {
        this.locationMapper = locationMapper;
        this.placeBadgeService = placeBadgeService;
    }

    @GetMapping("/detail")
    public String showPlaceDetail(@RequestParam("contentid") String contentid, Model model) {  // contentId를 String으로 처리
        // 장소 정보 + 뱃지 경로까지 포함
        Location location = placeBadgeService.getBadgeImgbyContentId(contentid);  // 쿼리에서 String 처리
        System.out.println("DEBUG contentid = " + contentid);
        System.out.println("DEBUG badgeImgPath = " + location.getBadgeImgPath());

        String homepageUrl = StringUtil.extractUrl(location.getHomepage());

        model.addAttribute("location", location);
        model.addAttribute("homepageUrl", homepageUrl);

        return "place/placeDetail";
    }
}

