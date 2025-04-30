package com.dahaedream.client.model;

import lombok.Data;

@Data
public class Client {

    //Request Table
    private int requestId;
    private int memberId;
    private int categoryId;
    private String title;
    private int isOnline;
    private int price;
    private String address;
    private String content;
    private String createdAt;
    private String status;



}
