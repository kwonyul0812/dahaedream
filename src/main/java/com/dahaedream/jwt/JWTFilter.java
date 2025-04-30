package com.dahaedream.jwt;


import com.dahaedream.jwt.model.CustomUserDetails;
import com.dahaedream.login.model.MemberDto;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class JWTFilter extends OncePerRequestFilter {

    private final JWTUtill jwtUtill;

    public JWTFilter(JWTUtill jwtUtill) {
        this.jwtUtill = jwtUtill;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        // request에서 Authorization 헤더를 찾음(jwt token의 내용)
        String authorization = request.getHeader("Authorization");

        // Authorization 헤더 검증
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            System.out.println("token null");
            filterChain.doFilter(request, response);

            // 조건이 해당되면 메소드 종료(필수)
            return;
        }

        System.out.println("authorization now");
        String token = authorization.split(" ")[1]; // Bearer 접두사 분리

        // 토큰 소멸 시간 검증
        if (jwtUtill.isExpired(token)) {
            System.out.println("token expired");
            filterChain.doFilter(request, response);

            // 조건이 해당되면 메소드 종료(필수)
            return;
        }

        // 토큰에서 memberId 와 nickname 획득
        int memberId = jwtUtill.getMemberId(token);
        String nickname = jwtUtill.getNickname(token);

        // MemberDto를 생성하여 값 set
        MemberDto member = new MemberDto();
        member.setMemberId(memberId);
        member.setNickname(nickname);

        // UserDetails에 회원 정보 객체 담기
        CustomUserDetails customUserDetails = new CustomUserDetails(member);

        // 스프링 시큐리티 인증 토큰 생성
        Authentication authToken = new UsernamePasswordAuthenticationToken(customUserDetails, null, customUserDetails.getAuthorities());
        //세션에 사용자 등록
        SecurityContextHolder.getContext().setAuthentication(authToken);

        filterChain.doFilter(request, response);

    }
}
