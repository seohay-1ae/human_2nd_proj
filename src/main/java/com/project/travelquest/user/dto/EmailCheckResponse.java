package com.project.travelquest.user.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

//이메일 중복 확인
public class EmailCheckResponse {
    private boolean exists;

    public EmailCheckResponse(boolean exists) {
        this.exists = exists;
    }
}
