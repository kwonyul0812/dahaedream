package com.dahaedream.client.controller;

import com.dahaedream.client.service.ClientService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Controller
@RequiredArgsConstructor
public class ClientController {


    private final ClientService clientService;

    @GetMapping("/client/add")
    public String clientAdd() {
        return "client/client-add";
    }

    @GetMapping("/client/request")
    public String clientRequest() {
        return "client/client-request";
    }

    @GetMapping("/client/list")
    public String clientInfo() {
        return "client/client-list";
    }
    @GetMapping("/client/info")
    public String client() {
        return "client/client-info";
    }

    @PostMapping("/client/insert.dox")
    @ResponseBody
    public String addRequest(Model model, @RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = clientService.insertRequest(map);
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/client/select.dox")
    @ResponseBody
    public String getRequestList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = clientService.selectRequestList(map);
        return new Gson().toJson(resultMap);
    }
}

