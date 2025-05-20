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

////         쿠키 방식으로 작동할경우 로그인페이지의 경우 jwt 검사를 하지 않도록 변경이 필요함...
//        String path = request.getRequestURI();
//
//        // 로그인 페이지는 JWT 체크 안 함
//        if (path.equals("/login/signin")) {
//            filterChain.doFilter(request, response);
//            return;
//        }

        //cookie들을 불러온 뒤 Authorization Key에 담긴 쿠키를 찾음
        String authorization = null;
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for (Cookie cookie : cookies) {

                System.out.println(cookie.getName());
                if (cookie.getName().equals("Authorization")) {

                    authorization = cookie.getValue();
                }
            }
        }

        //Authorization 헤더 검증
        if (authorization == null) {

            System.out.println("token null");
            filterChain.doFilter(request, response);

            //조건이 해당되면 메소드 종료 (필수)
            return;
        }

        //토큰
        String token = authorization;

        //토큰 소멸 시간 검증
        if (jwtUtil.isExpired(token)) {

            System.out.println("token expired");

            // 쿠키 삭제: 만료된 JWT 쿠키 삭제
            Cookie expiredCookie = new Cookie("Authorization", null);
            expiredCookie.setPath("/");  // 쿠키가 설정된 경로와 동일해야 함
            expiredCookie.setMaxAge(0);  // 쿠키를 삭제하기 위해 Max-Age를 0으로 설정
            response.addCookie(expiredCookie);

            // AJAX 요청인지 확인
//            boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
//
//            // AJAX 요청인 경우 401 응답 보내기
//            if (isAjax) {
//                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//                response.setContentType("application/json");
//                response.getWriter().write("{\"error\": \"expired\"}");
//            } else {
//                // 일반 요청인 경우 로그인 페이지로 리다이렉트
//                response.sendRedirect("/login/signin?error=expired");
//            }

            // 하이퍼링크 요청인지 확인...
            boolean isHyperlinkRequest =
                    !"XMLHttpRequest".equals(request.getHeader("X-Requested-With")) &&
                    request.getHeader("Accept") != null &&
                    request.getHeader("Accept").contains("text/html") &&
                    "GET".equals(request.getMethod());

            if (isHyperlinkRequest) {
                response.sendRedirect("/login/signin?error=expired");
                return;
            }

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
