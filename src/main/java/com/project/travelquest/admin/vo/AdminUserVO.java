package com.project.travelquest.admin.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class AdminUserVO {

    private Long userId;
    private String userName;
    private String userEmail;
}
