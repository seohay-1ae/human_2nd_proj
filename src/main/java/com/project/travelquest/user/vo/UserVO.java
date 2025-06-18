package com.project.travelquest.user.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UserVO {
    private String username;
    private String password;
    private String email;
    private String phone_number;
    private String cert_number;
    
    // 비밀번호 확인용: DB 저장 제외
    private transient String password_check;
    }
