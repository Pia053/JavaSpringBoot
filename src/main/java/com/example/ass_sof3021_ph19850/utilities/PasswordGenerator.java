package com.example.ass_sof3021_ph19850.utilities;

import org.apache.commons.lang3.RandomStringUtils;

public class PasswordGenerator {

    public static String generateRandomPassword(int length) {
        return RandomStringUtils.random(length, true, true);
    }
}
