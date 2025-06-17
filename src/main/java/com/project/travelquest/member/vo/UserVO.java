package com.project.travelquest.member.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UserVO {
    private String username;
    private String password;
    private String passwordCheck;
    private String email;
    private String phone_number;
    private String cert_number;
    }
