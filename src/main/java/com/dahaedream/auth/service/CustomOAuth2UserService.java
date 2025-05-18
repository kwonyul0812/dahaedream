package com.dahaedream.auth.service;

import com.dahaedream.auth.model.CustomOAuth2User;
import com.dahaedream.auth.model.KakaoResponse;
import com.dahaedream.auth.model.OAuth2Response;
import com.dahaedream.auth.model.UserDto;
import com.dahaedream.login.mapper.LoginMapper;
import com.dahaedream.login.model.MemberDto;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.OAuth2Error;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;


@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final LoginMapper loginMapper;

    public CustomOAuth2UserService(LoginMapper loginMapper) {
        this.loginMapper = loginMapper;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        OAuth2User oAuth2User = super.loadUser(userRequest);
        System.out.println(oAuth2User);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        OAuth2Response oAuth2Response = null;
        if (registrationId.equals("kakao")) {
            oAuth2Response = new KakaoResponse(oAuth2User.getAttributes());
        } else {
            return null;
        }

        MemberDto existData = loginMapper.selectByEmail(oAuth2Response.getEmail());

        if (existData == null) {
            // 해당 이메일로 가입된 계정이 없다면...
            MemberDto member = new MemberDto();
            member.setEmail(oAuth2Response.getEmail());
            member.setNickname(oAuth2Response.getName());

            loginMapper.insertSocialMember(member);

            UserDto userDto = new UserDto();
            userDto.setMemberId(member.getMemberId());
            userDto.setName(member.getNickname());

            return new CustomOAuth2User(userDto);
        } else if(existData.getIsSocial().equals("Y")) {
            // 해당 이메일이 소셜로그인 이메일인지 검증
            existData.setNickname(oAuth2Response.getName());

            loginMapper.updateSocialMember(existData);

            UserDto userDto = new UserDto();
            userDto.setMemberId(existData.getMemberId());
            userDto.setName(oAuth2Response.getName());

            return new CustomOAuth2User(userDto);
        } else {
            // 동일한 이메일 계정이 있고 소셜로그인 계정이 아니라면 오류 발생
            throw new OAuth2AuthenticationException(new OAuth2Error("invalid_request"));
        }
    }
}
