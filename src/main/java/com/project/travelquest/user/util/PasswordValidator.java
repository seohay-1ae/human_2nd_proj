package com.project.travelquest.user.util;

public class PasswordValidator {

    //비밀번로 확인 함수
    public static boolean isValid(String pw, String confirmPw) {
        return pw != null && pw.equals(confirmPw);
    }
}
