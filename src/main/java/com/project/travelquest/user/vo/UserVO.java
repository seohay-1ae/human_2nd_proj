package com.project.travelquest.user.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
public class UserVO {
    //회원가입 및 아이디 찾기용
    private String user_name;
    private String user_password;
    private String user_email;

    // 로그인용 UserVO -> 변수명 확실하지 않아서 따로 빼 놓음
//    private String userId;
//    private String userPw;
//    private String userName;

    // 비밀번호 확인용: DB 저장 제외
    private transient String password_check;

    // 인증번호 확인용: DB 저장 제외
    private transient String phone_number;
    private transient String cert_number;
    }
