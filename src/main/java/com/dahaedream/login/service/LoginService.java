package com.dahaedream.login.service;

import com.dahaedream.login.mapper.LoginMapper;
import com.dahaedream.login.model.MemberDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final LoginMapper mapper;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public int createMember(MemberDto member) {

        String email = member.getEmail();
        String password = member.getPassword();

        boolean checkEmail = mapper.isExistEmail(email);

        if (checkEmail) {

            return 0;
        }

        // 이메일 중복이 없다면 비밀번호 암호화
        member.setPassword(bCryptPasswordEncoder.encode(password));

        // member 테이블에 회원정보 insert
//        int result = mapper.insertMember(member);
        mapper.insertMember(member);


        if(member.getMemberId() != null) {
            mapper.insertMemberPoint(member.getMemberId());
            return 1;
        } else {
            return 0;
        }
    }

    public MemberDto getByEmail(String email) {
        return mapper.selectByEmail(email);
    }
}
