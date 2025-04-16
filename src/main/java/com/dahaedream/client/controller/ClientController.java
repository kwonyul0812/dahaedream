package com.dahaedream.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClientController {

    @GetMapping("/client/add")
    public String clientAdd() {
        return "/client/client-add";
    }

    @GetMapping("/client/request")
    public String clientRequest() {
        return "/client/client-request";
    }

    @GetMapping("/client/list")
    public String clientInfo() {
        return "/client/client-list";
    }
    @GetMapping("/client/info")
    public String client() {
        return "/client/client-info";
    }
}

