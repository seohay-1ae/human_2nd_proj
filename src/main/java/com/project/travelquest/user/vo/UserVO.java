package com.project.travelquest.user.vo;

public class UserVO {
    private String name;
    private String email;

    // 기본 생성자
    public UserVO() {}

    // getter & setter
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
