package com.project.travelquest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//@MapperScan({"com.project.travelquest.avatar.mapper",
//        "com.project.travelquest.badge.mapper",
//        "com.project.travelquest.map.mapper",
//        "com.project.travelquest.openapi.mapper",
//        "com.project.travelquest.review.mapper",
//        "com.project.travelquest.user.dao",
//        "com.project.travelquest.admin.dao",
//        "com.project.travelquest.comu.dao"
//})
public class TravelquestApplication {

    public static void main(String[] args) {
        SpringApplication.run(TravelquestApplication.class, args);
    }
}
