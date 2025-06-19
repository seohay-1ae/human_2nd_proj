package com.project.travelquest.user.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
//이메일 중복 확인
public class EmailCheckResponse {
    private boolean exists;

    public EmailCheckResponse(boolean exists) {
        this.exists = exists;
    }
}
