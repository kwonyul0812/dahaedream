package com.dahaedream.point.service;

import com.dahaedream.mypage.mapper.MypageMapper;
import com.dahaedream.point.mapper.PointMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Service
@RequiredArgsConstructor
public class PointService {

    private final PointMapper pointMapper;
    private final MypageMapper mypageMapper;

    @Transactional
    public HashMap<String, Object> increasePoint(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();

        int currentPoint = mypageMapper.selectPointByMemberId((Integer) map.get("memberId"));
        int amount = Integer.parseInt(map.get("changeAmount").toString());
        map.put("balanceAfter", currentPoint + amount);

        pointMapper.increasePoint(map);
        pointMapper.insertPointHistory(map);

        resultMap.put("result", "success");
        return resultMap;
    }
    @Transactional
    public HashMap<String, Object> decreasePoint(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();

        int currentPoint = mypageMapper.selectPointByMemberId((Integer) map.get("memberId"));
        int amount = Integer.parseInt(map.get("changeAmount").toString());

        if(currentPoint < amount) {
            resultMap.put("result", "fail");
            return resultMap;
        }

        map.put("balanceAfter", currentPoint - amount);
        pointMapper.decreasePoint(map);
        pointMapper.insertPointHistory(map);
        resultMap.put("result", "success");
        return resultMap;
    }

}
