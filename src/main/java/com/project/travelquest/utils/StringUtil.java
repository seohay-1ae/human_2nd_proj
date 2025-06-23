package com.project.travelquest.utils;

public class StringUtil {
    public static String extractUrl(String text) {
        if (text == null) return null;
        String[] tokens = text.split("\\s+");
        for (String token : tokens) {
            if (token.startsWith("http://") || token.startsWith("https://")) {
                return token;
            }
        }
        return null;
    }
}
