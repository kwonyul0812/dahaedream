package com.dahaedream.login.mapper;


import com.dahaedream.login.model.MemberDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {

    // 이메일이 존재하는지 확인
    Boolean isExistEmail(String email);

    // 회원가입 insert
    int insertMember(MemberDto member);

}
