package com.dahaedream.login.controller;

import com.dahaedream.login.model.MemberDto;
import com.dahaedream.login.service.LoginService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final LoginService service;

    @GetMapping("/login/signin")
    public String login() {
        return "login/signin";
    }

    @GetMapping("/login/signup")
    public String signup() {
        return "login/signup";
    }

    @PostMapping("/login/signup")
    @ResponseBody
    public ResponseEntity signup(@ModelAttribute MemberDto member) {

        int result = service.createMember(member);

        if (result == 1) {
            return ResponseEntity.ok().build(); // 성공 응답gownj

        } else {
            return ResponseEntity.badRequest().build(); // 실패 응답
        }
    }
}
