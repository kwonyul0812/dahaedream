package com.dahaedream.solver.service;

import com.dahaedream.solver.mapper.SolverMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SolverService {
    private final SolverMapper solverMapper;
}
