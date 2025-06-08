package com.dahaedream.client.service;

import com.dahaedream.client.mapper.ClientMapper;
import com.dahaedream.client.model.Client;
import com.dahaedream.common.mapper.CommonMapper;
import com.dahaedream.common.model.Common;
import com.dahaedream.solver.model.Solver;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ClientService {

    private final ClientMapper clientMapper;
    private final CommonMapper commonMapper;

    public HashMap<String, Object> insertRequest(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        clientMapper.insertRequest(map);
        resultMap.put("result", "success");
        resultMap.put("requestId", map.get("requestId"));
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

    public HashMap<String, Object> updateRequestAccept(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        clientMapper.updateRequestAccept(map);
        clientMapper.updateRequestStatus(map);
        resultMap.put("result", "success");
        return resultMap;
    }

    public HashMap<String, Object> selectMyRequestList(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<Client> list = clientMapper.selectMyRequestList(map);
        resultMap.put("list", list);
        resultMap.put("result", "success");
        return resultMap;

    }

    public HashMap<String, Object> deleteRequest(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        int count = clientMapper.selectRequestAcceptCnt(map);
        if(count > 0) {
            resultMap.put("message", "수락 대기중이거나 진행중인 의뢰입니다.");
        } else {
            clientMapper.deleteRequest(map);
            resultMap.put("message", "삭제되었습니다.");
        }
        return resultMap;
    }

    public HashMap<String, Object> cancelRequest(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        clientMapper.cancelRequest(map);
        resultMap.put("message", "취소되었습니다.");
        return resultMap;
    }

    public HashMap<String, Object> completeRequest(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        clientMapper.completeRequest(map);
        resultMap.put("message", "완료처리 되었습니다.");
        return resultMap;
    }
}
