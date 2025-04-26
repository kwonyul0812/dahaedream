package com.dahaedream.login.controller;

import com.dahaedream.login.model.MemberDto;
import com.dahaedream.login.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final LoginService service;

    @GetMapping("/login")
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

        service.createMember(member);

        return ResponseEntity.ok().build();
    }

}
