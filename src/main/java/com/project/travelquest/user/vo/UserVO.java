package com.project.travelquest.user.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class UserVO {
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
}
