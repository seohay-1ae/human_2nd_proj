//package com.project.travelquest.map.controller;
//
//import com.project.travelquest.map.model.Location;
//import com.project.travelquest.map.service.PlaceBadgeService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//@Controller
//public class PlaceBadgeController {
//    private final PlaceBadgeService placeBadgeService;
//
//    @Autowired
//    public PlaceBadgeController(PlaceBadgeService placeBadgeService) {
//        this.placeBadgeService = placeBadgeService;
//    }
//
//    @GetMapping("/place/detail")
//    public String showLocationDetail(@RequestParam(value = "contentid", required = false) Integer contentId, Model model) {
//        // contentId를 기준으로 뱃지 이미지 정보 포함된 장소 정보 조회
//        if (contentId == null) {
//            // contentId 없을 때 예외처리 혹은 기본값 설정
//            return "errorPage"; // 예: 에러페이지로 이동하거나 적절히 처리
//        }
//        Location location = placeBadgeService.getBadgeImgbyContentId(contentId);
//
//        System.out.println("컨트롤러 전달 badgeImgPath: " + location.getBadgeImgPath());
//
//        // JSP에 전달
//        model.addAttribute("location", location);
//
//        return "place/placeDetail"; // /WEB-INF/views/place/placeDetail.jsp 로 연결됨
//    }
//}
//
