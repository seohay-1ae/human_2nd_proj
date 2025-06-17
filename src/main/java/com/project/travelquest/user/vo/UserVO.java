package com.project.travelquest.user.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
public class UserVO {

    private String user_id;
    private String user_pw;
    private String user_name;
    private String user_phoneNumber;
    private Date joinDate;
}

