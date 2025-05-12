package com.dahaedream.solver.model;

import lombok.Data;

@Data
public class Solver {

    // Request Accept Table

    private String requestId;
    private String solverId;

    //Request Table
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

    //category
    private String categoryName;

    //member

    private String solverName;
    private String clientName;

}
