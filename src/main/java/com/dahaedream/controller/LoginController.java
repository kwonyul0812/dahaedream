package com.dahaedream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
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
