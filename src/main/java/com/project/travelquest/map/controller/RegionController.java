package com.project.travelquest.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/region")
public class RegionController {

    @GetMapping
    public String showNationwideMap() {
        return "map/koreaMap"; // /WEB-INF/views/map/koreaMap.jsp
    }

    @GetMapping("/{region}")
    public String showRegionMap(@PathVariable String region, Model model) {
        // 예: region == "chungnam" or "daejeon"
        model.addAttribute("region", region);
        return "map/regionDetail"; // /WEB-INF/views/map/regionDetail.jsp
    }
}

