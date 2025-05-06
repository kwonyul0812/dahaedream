package com.dahaedream.auth.model;

public interface OAuth2Response {

    // 제공자 (Ex. 카카오)
    String getProvider();
    // 제공자로부터 발급해주는 아이디(번호)
    String getProviderId();
    // 이메일
    String getEmail();
    //사용자 이름(닉네임)
    String getName();
}
