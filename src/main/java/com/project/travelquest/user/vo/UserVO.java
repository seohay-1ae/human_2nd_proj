package com.project.travelquest.user.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
public class UserVO {
    private String username;
    private String password;
    private String email;

    // 로그인용 UserVO
    private String userId;
    private String userPw;
    private String userName;

    // 비밀번호 확인용: DB 저장 제외
    private transient String password_check;

    // 인증번호 확인용: DB 저장 제외
    private transient String phone_number;
    private transient String cert_number;
    }
