package com.dahaedream.login.model;

import lombok.Data;

@Data
public class MemberDto {
    private int memberId;
    private String email;
    private String password;
    private String nickname;
    private String address;
    private String phone;
    private String isSocial;
}
