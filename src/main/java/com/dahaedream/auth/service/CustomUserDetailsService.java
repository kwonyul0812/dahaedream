package com.dahaedream.auth.service;

import com.dahaedream.auth.model.CustomUserDetails;
import com.dahaedream.login.mapper.LoginMapper;
import com.dahaedream.login.model.MemberDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final LoginMapper loginMapper;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        MemberDto member = loginMapper.selectByEmail(email);

        if (member != null) {

            return new CustomUserDetails(member);
        }

        return null;
    }

}
