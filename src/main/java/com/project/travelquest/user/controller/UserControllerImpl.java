package com.project.travelquest.user.controller;

import com.project.travelquest.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserControllerImpl implements UserController {

    @Autowired
    UserService userService;
}
