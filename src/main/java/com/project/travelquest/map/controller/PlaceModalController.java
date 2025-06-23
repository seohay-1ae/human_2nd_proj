//package com.project.travelquest.map.controller;
//
//import com.project.travelquest.map.model.Location;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//@Controller
//public class PlaceModalController {
//    @GetMapping("/place/detailModal")
//    public String showDetailModal(@RequestParam Long contentid, Model model) {
//        Location location = locationService.getLocationById(contentid);
//        model.addAttribute("location", location);
//        return "place/detailModal"; // => /WEB-INF/views/place/detailModal.jsp
//    }
//}
