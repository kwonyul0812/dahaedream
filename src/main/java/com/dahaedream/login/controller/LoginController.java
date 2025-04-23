package com.dahaedream.login.controller;

import com.dahaedream.test.mapper.testMapper;
import com.dahaedream.test.model.testDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class LoginController {

    @GetMapping("/login")
    public String login() {
        return "login/signin";
    }

    @GetMapping("/login/signup")
    public String signup() {
        return "login/signup";
    }


}
