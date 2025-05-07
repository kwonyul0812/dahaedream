package com.dahaedream.solver.controller;

import com.dahaedream.solver.service.SolverService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
}
