package com.dahaedream.solver.service;

import com.dahaedream.solver.mapper.SolverMapper;
import com.dahaedream.solver.model.Solver;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SolverService {
    private final SolverMapper solverMapper;

    public HashMap<String, Object> insertRequestAccept(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        solverMapper.insertRequestAccept(map);
        resultMap.put("result", "success");
        return resultMap;
    }

    public HashMap<String, Object> getRequest(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<Solver> list = solverMapper.selectRequest(map);
        resultMap.put("list", list);
        resultMap.put("result", "success");
        return resultMap;
    }

    public HashMap<String, Object> getAcceptRequest(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<Solver> list = solverMapper.selectAcceptRequest(map);
        resultMap.put("list", list);
        resultMap.put("result", "success");
        return resultMap;
    }

    public HashMap<String, Object> getCompleteRequest(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<Solver> list = solverMapper.selectCompleteRequest(map);
        resultMap.put("list", list);
        resultMap.put("result", "success");
        return resultMap;
    }
}
