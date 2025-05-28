package com.dahaedream.auth.oauth2;

import com.dahaedream.auth.jwt.JWTUtil;
import com.dahaedream.auth.model.CustomOAuth2User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomOAuth2SuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private final JWTUtil jwtUtil;

    public CustomOAuth2SuccessHandler(JWTUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        //OAuth2User
        CustomOAuth2User customUserDetails = (CustomOAuth2User) authentication.getPrincipal();

        int memberId = customUserDetails.getMemberId();
        String email = customUserDetails.getEmail();
        String nickname = customUserDetails.getName();

        String token = jwtUtil.createJwt(memberId, email, nickname, 60 * 60 * 1000 * 10L);

        response.addCookie(createCookie("Authorization", token));
        response.sendRedirect("/");
    }

    private Cookie createCookie(String key, String value) {
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(60 * 60 * 10);
        cookie.setPath("/");
        cookie.setHttpOnly(true);

        return cookie;
    }
}
