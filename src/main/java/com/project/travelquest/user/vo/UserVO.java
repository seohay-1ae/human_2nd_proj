package com.project.travelquest.user.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class UserVO {
    //회원가입 및 아이디 찾기용
    private Long user_id;
    private String user_name;
    private String user_email;
    private String user_phone_num;
    private String user_password;
    private Date user_joindate;
    private String user_profile_text;
    private String user_role;
    private String user_status;
    private String avatar_preset_id;

    // 비밀번호 확인용: DB 저장 제외
    private transient String password_check;

    // 인증번호 확인용: DB 저장 제외
    private transient String phone_number;
    private transient String cert_number;
    }
