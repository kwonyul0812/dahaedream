package com.dahaedream.login.service;

import com.dahaedream.login.mapper.LoginMapper;
import com.dahaedream.login.model.MemberDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final LoginMapper mapper;

    public void createMember(MemberDto member) {

        String email = member.getEmail();
        String password = member.getPassword();
        String nickname = member.getNickname();
        String address = member.getAddress();
        String phone = member.getPhone();

        boolean checkEmail = mapper.isExistEmail(email);

        System.out.println(checkEmail);
    }
}
