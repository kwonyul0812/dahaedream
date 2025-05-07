package com.dahaedream.client.model;

import lombok.Data;

@Data
public class Client {

    //Request Table
    private int requestId;
    private int memberId;
    private int categoryId;
    private String title;
    private String onOff;
    private int price;
    private String address;
    private String content;
    private String createdAt;
    private String status;
    private String isOnline;

    //Member Table
    private String nickname;

    //Category Table
    private String categoryName;



}
