package com.dahaedream.auth.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDto {

    private int memberId; // 회원번호
    private String email;
    private String name; // 닉네임
}
