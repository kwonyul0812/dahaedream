package com.dahaedream.auth.config;

import com.dahaedream.auth.filter.JWTFilter;
import com.dahaedream.auth.JWTUtill;
import com.dahaedream.auth.filter.LoginFilter;
import com.dahaedream.auth.service.CustomOAuth2UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;


@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final AuthenticationConfiguration authenticationConfiguration;
    private final JWTUtill jwtUtill;
//    private final CustomOAuth2UserService customOAuth2UserService;

    public SecurityConfig(AuthenticationConfiguration authenticationConfiguration, JWTUtill jwtUtill) {
        this.authenticationConfiguration = authenticationConfiguration;
        this.jwtUtill = jwtUtill;
    }

//    public SecurityConfig(AuthenticationConfiguration authenticationConfiguration, JWTUtill jwtUtill, CustomOAuth2UserService customOAuth2UserService) {
//        this.authenticationConfiguration = authenticationConfiguration;
//        this.jwtUtill = jwtUtill;
//        this.customOAuth2UserService = customOAuth2UserService;
//    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        // csrf disable
        http
                .csrf((auth) -> auth.disable());

        // 시큐리티 기본 로그인폼 disable
        http
                .formLogin((auth) -> auth.disable());

        // http basic 인증 방식 disable
        http
                .httpBasic((auth) -> auth.disable());
//        //oauth2
//        http
//                .oauth2Login((oauth2) -> oauth2
//                        .userInfoEndpoint(userInfoEndpointConfig -> userInfoEndpointConfig
//                                .userService(customOAuth2UserService)));

        //경로별 인가 작업, 컨트롤러에서 @PreAuthorize 로 권한 확인절차 해도 됨.
//        http
//                .authorizeHttpRequests((auth) -> auth
//                        .requestMatchers("/login", "/", "/join").permitAll()
//                        .requestMatchers("/admin").hasRole("ADMIN")
//                        .anyRequest().authenticated());


        // jwt filter 등록
        http
                .addFilterBefore(new JWTFilter(jwtUtill), LoginFilter.class);
        // 필터 추가 LoginFilter()는 인자를 받음(AuthenticationManager() 메소드에 authenticationConfiguration 객체를 넣어야함) 따라서 등록 필요
        http
                .addFilterAt(new LoginFilter(authenticationManager(authenticationConfiguration), jwtUtill), UsernamePasswordAuthenticationFilter.class);

        //세션 설정
        http
                .sessionManagement((session) -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS));


        return http.build();
    }
}
