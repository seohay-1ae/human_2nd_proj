package com.project.travelquest.avatar.controller;

import com.project.travelquest.avatar.dto.AvatarPresetDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AvatarController {

    @GetMapping("/avatar")
    public String showAvatar(Model model) {
        // 예시 아바타 데이터
        AvatarPresetDto preset = new AvatarPresetDto();
        preset.setSkin("skins/02.png");
        preset.setHands("hands/01.png");
        preset.setBottoms("bottoms/01.png");
        preset.setTops("tops/04.png");
        preset.setHats("hats/03.png");

        model.addAttribute("preset", preset);
        return "avatar"; // avatar.jsp
    }
}
