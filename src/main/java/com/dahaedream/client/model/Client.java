package com.dahaedream.client.model;

import lombok.Data;

@Data
public class Client {
    private int requestId;
    private String title;
    private int categoryId;
    private int isOnline;
    private int price;
    private String address;
    private String content;
    private int statusId;
}
