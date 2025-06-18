package com.project.travelquest.user.util;

import java.util.Random;

public class CertNumberGenerator {
    public static String generateCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000); // 6 자리 숫자
        return String.valueOf(code);
    }
}
