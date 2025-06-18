package com.project.travelquest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LayoutTestController {
    @GetMapping("/layoutTest")
    public String showPage() {
        return "layoutTest"; // /WEB-INF/views/yourPage.jsp 로 이동
    }
}
