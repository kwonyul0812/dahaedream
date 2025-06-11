package com.dahaedream.common;

import java.util.UUID;

public class Common {
    public static String genSaveFileName(String ext) {
        return UUID.randomUUID().toString().replace("-", "") + ext;
    }
}
