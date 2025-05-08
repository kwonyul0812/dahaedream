package com.dahaedream.auth.filter;


import com.dahaedream.auth.jwt.JWTUtil;
import com.dahaedream.auth.model.CustomUserDetails;
import com.dahaedream.login.model.MemberDto;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class JWTFilter extends OncePerRequestFilter {

    private final JWTUtil jwtUtil;

    public JWTFilter(JWTUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        String path = request.getRequestURI();

        // 로그인 페이지는 JWT 체크 안 함
        if (path.equals("/login/signin")) {
            filterChain.doFilter(request, response);
            return;
        }

        // request에서 Authorization 헤더를 찾음(jwt token의 내용)
        String authorization = request.getHeader("Authorization");

        //Authorization 헤더 검증
        if (authorization == null || !authorization.startsWith("Bearer ")) {

            System.out.println("token null");
            filterChain.doFilter(request, response);

            //조건이 해당되면 메소드 종료 (필수)
            return;
        }

        System.out.println("authorization now");
        String token = authorization.split(" ")[1]; // Bearer 접두사 분리

        //토큰 소멸 시간 검증
        if (jwtUtil.isExpired(token)) {

            System.out.println("token expired");
            filterChain.doFilter(request, response);

            //조건이 해당되면 메소드 종료 (필수)
            return;
        }

        // 토큰에서 memberId 와 nickname 획득
        int memberId = jwtUtil.getMemberId(token);
        String nickname = jwtUtil.getNickname(token);

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
        System.out.println("토큰 인증 성공");

        filterChain.doFilter(request, response);

    }
}
