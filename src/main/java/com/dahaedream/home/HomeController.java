package com.dahaedream.home;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home";
    }
    @GetMapping("/request/list")
    public String requestList() {
        return "request-list";
    }
}
