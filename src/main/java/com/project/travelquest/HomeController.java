package com.project.travelquest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/")
    public String home() {
        return "map/main"; // /WEB-INF/views/main.jsp 로 이동
    }
}

