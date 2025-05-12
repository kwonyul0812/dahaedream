package com.dahaedream.client.service;

import com.dahaedream.client.mapper.ClientMapper;
import com.dahaedream.client.model.Client;
import com.dahaedream.solver.model.Solver;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ClientService {

    private final ClientMapper clientMapper;

    public HashMap<String, Object> insertRequest(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        clientMapper.insertRequest(map);
        resultMap.put("result", "success");
        return resultMap;
    }

    public HashMap<String, Object> selectRequestList(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<Client> requestList =  clientMapper.selectRequestList(map);
        resultMap.put("list", requestList);
        resultMap.put("result", "success");
        return resultMap;
    }

    public HashMap<String, Object> selectInfo(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        Client info = clientMapper.selectInfo(map);
        int count = clientMapper.selectRequest(map);
        boolean alreadySent = count > 0;
        resultMap.put("alreadySent", alreadySent);
        resultMap.put("info", info);
        resultMap.put("result", "success");
        return resultMap;
    }

    public HashMap<String, Object> selectRequest(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<Solver> list = clientMapper.selectRequestAccept(map);
        resultMap.put("list", list);
        resultMap.put("result", "success");
        return resultMap;
    }
}
