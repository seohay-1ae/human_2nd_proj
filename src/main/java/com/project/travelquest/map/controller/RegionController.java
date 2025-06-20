package com.project.travelquest.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
//import com.project.travelquest.utils.RegionNameMapper;

@Controller
@RequestMapping("/region")
public class RegionController {

    @GetMapping
    public String showNationwideMap() {
        return "map/koreaMap"; // /WEB-INF/views/map/koreaMap.jsp
    }

    @GetMapping("/{region}")
    public String showRegionMap(@PathVariable String region, Model model) {
        model.addAttribute("region", region); // 영문
//        model.addAttribute("regionKr", RegionNameMapper.getRegionKr(region)); // 한글
        return "map/regionDetail"; // /WEB-INF/views/map/regionDetail.jsp
    }
}

