package com.project.travelquest.avatar.controller;

import com.project.travelquest.avatar.service.AvatarService;
import com.project.travelquest.avatar.vo.AvatarVO;
import com.project.travelquest.user.vo.UserVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/avatar")
public class AvatarController {

    private final AvatarService avatarService;

    public AvatarController(AvatarService avatarService) {
        this.avatarService = avatarService;
    }

    @GetMapping("/items")
    public List<AvatarVO> getItems(@RequestParam("avatar_item_type") String avatar_item_type) {
        return avatarService.getItemsByType(avatar_item_type);
    }
}
