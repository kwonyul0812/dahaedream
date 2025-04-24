package com.dahaedream.client.service;

import com.dahaedream.client.mapper.ClientMapper;
import com.dahaedream.client.model.Client;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
@RequiredArgsConstructor
public class ClientService {

    private final ClientMapper clientMapper;

    public HashMap<String, Object> selectClient(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        Client client = clientMapper.selectClient(map);
        resultMap.put("client", client);
        return resultMap;

    }
}
