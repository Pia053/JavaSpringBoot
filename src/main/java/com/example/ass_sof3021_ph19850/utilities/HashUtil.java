package com.example.ass_sof3021_ph19850.utilities;

import org.mindrot.jbcrypt.BCrypt;

public class HashUtil {
    public static String hash(String palin) {
        // kiểm tra chuối mã hóa
        String salt = BCrypt.gensalt();
        // password  + salt = chuỗi mã hóa
        return BCrypt.hashpw(palin, salt);
    }

    // palin cliend, hased data
    public static Boolean verify(String palin, String hased) {
        return BCrypt.checkpw(palin, hased);
    }
}
