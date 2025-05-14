package com.dahaedream.client.controller;

import com.dahaedream.client.mapper.ClientMapper;
import com.dahaedream.client.service.ClientService;
import com.dahaedream.login.model.MemberDto;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Controller
@RequiredArgsConstructor
public class ClientController {


    private final ClientService clientService;
    private final ClientMapper clientMapper;

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

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

//        if(authentication.getPrincipal() instanceof CustomUserDetails userDetails) {
//            Integer memberId = userDetails.getMemberId();
//            map.put("memberId", memberId);
//
//            resultMap.put("memberId", memberId);
//
//        } else {
//            System.out.println(authentication.getPrincipal());
//
//        }
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/client/info.dox")
    @ResponseBody
    public String getInfo(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = clientService.selectInfo(map);
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/client/getRequestAccept.dox")
    @ResponseBody
    public String getRequest(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = clientService.selectRequest(map);
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/client/editRequestAccept.dox")
    @ResponseBody
    public String updateRequestAccept(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = clientService.updateRequestAccept(map);
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/client/getRequest.dox")
    @ResponseBody
    public String getRequestList(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = clientService.selectMyRequestList(map);
        return new Gson().toJson(resultMap);

    }

    @PostMapping("/client/delete.dox")
    @ResponseBody
    public String deleteRequest(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = clientService.deleteRequest(map);
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/client/cancelRequest.dox")
    @ResponseBody
    public String cancelRequest(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = clientService.cancelRequest(map);
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/client/completeRequest.dox")
    @ResponseBody
    public String completeRequest(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = clientService.completeRequest(map);
        return new Gson().toJson(resultMap);

    }


}

