package com.project.travelquest.avatar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AvatarController {
    @GetMapping("/avatar")
    public String showPage() {
        return "avatar";
    }
}
