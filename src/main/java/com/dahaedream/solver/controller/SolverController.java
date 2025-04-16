package com.dahaedream.solver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SolverController {
    @GetMapping("/solver/list")
    public String list() {
        return "/solver/solver-list";
    }
    @GetMapping("/solver/send")
    public String send() {
        return "/solver/solver-send";
    }
}
