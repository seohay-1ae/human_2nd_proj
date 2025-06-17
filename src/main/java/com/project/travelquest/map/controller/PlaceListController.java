package com.project.travelquest.map.controller;

import com.project.travelquest.map.model.TourPlace;
import com.project.travelquest.map.service.PlaceListService;
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

        model.addAttribute("placeList", placeList);
        model.addAttribute("region", region);
        model.addAttribute("subregion", subregion);

        return "map/placeList";  // JSP 경로: /WEB-INF/views/map/placeList.jsp
    }
}
