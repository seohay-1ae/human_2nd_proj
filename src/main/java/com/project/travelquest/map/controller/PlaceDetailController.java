package com.project.travelquest.map.controller;

import com.project.travelquest.map.model.Location;
import com.project.travelquest.map.mapper.LocationMapper;
import com.project.travelquest.utils.StringUtil; // ✅ 반드시 import

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/place")
public class PlaceDetailController {

    private final LocationMapper locationMapper;

    public PlaceDetailController(LocationMapper locationMapper) {
        this.locationMapper = locationMapper;
    }

    @GetMapping("/detail")
    public String showPlaceDetail(@RequestParam("contentid") long contentid, Model model) {
        Location location = locationMapper.getLocationById(contentid);
        System.out.println("DEBUG contentid = " + contentid);  // 콘솔 출력

        String homepageUrl = StringUtil.extractUrl(location.getHomepage());

        model.addAttribute("location", location);
        model.addAttribute("homepageUrl", homepageUrl); // ✅ JSP에서 쓸 수 있도록 전달

        return "place/placeDetail"; // /WEB-INF/views/place/placeDetail.jsp
    }
}
