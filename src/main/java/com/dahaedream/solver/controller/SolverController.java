package com.dahaedream.solver.controller;

import com.dahaedream.solver.service.SolverService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequiredArgsConstructor
public class SolverController {

    private final SolverService solverService;

    @GetMapping("/solver/list")
    public String list() {
        return "solver/solver-list";
    }
    @GetMapping("/solver/send")
    public String send() {
        return "solver/solver-send";
    }

    @PostMapping("/solver/send.dox")
    @ResponseBody
    public String sendRequestAccept(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = solverService.insertRequestAccept(map);
        return new Gson().toJson(resultMap);

    }

    @PostMapping("/solver/getRequest.dox")
    @ResponseBody
    public String requestAccept(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = solverService.getRequest(map);
        return new Gson().toJson(resultMap);

    }

    @PostMapping("/solver/getAcceptRequest.dox")
    @ResponseBody
    public String getAcceptRequest(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = solverService.getAcceptRequest(map);
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/solver/getCompleteRequest.dox")
    @ResponseBody
    public String getCompleteRequest(@RequestBody HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = solverService.getCompleteRequest(map);
        return new Gson().toJson(resultMap);
    }


}
