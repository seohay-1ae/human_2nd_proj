package com.project.travelquest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyAvatarController {
    @GetMapping("/myavatarTest")
    public String showPage() {
        return "myAvatar"; // /WEB-INF/views/yourPage.jsp 로 이동
    }
}
