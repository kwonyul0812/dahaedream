package com.dahaedream.login.model;

import lombok.Data;

@Data
public class MemberDto {
    private Integer memberId;
    private String email;
    private String password;
    private String nickname;
    private String address;
    private String phone;
    private String isSocial;
}
