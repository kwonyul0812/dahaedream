package com.dahaedream.login.mapper;


import com.dahaedream.login.model.MemberDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {

    // 이메일이 존재하는지 확인
    Boolean isExistEmail(String email);

    // 회원 조회
    MemberDto selectByEmail(String email);

    // 회원가입 insert
    int insertMember(MemberDto member);

    // 소셜로그인용 insert
    int insertSocialMember(MemberDto member);

    // 소셜로그인 회원 업데이트
    int updateSocialMember(MemberDto member);

}
