package com.dahaedream.common.model;

import lombok.Data;

@Data
public class Common {
    private int categoryId;
    private String categoryName;

    // img Table
    private String imgId;
    private String requestId;
    private String filePath;
    private String fileName;
    private int thumbnail;

}
