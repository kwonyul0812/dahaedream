package com.dahaedream.common.service;

import com.dahaedream.client.model.Client;
import com.dahaedream.common.mapper.CommonMapper;
import com.dahaedream.common.model.Common;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service
@RequiredArgsConstructor
public class CommonService {
    private final CommonMapper commonMapper;

    public HashMap<String, Object> selectCategory(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<Common> categoryList = commonMapper.selectCategory(map);
        resultMap.put("categoryList", categoryList);
        return resultMap;

    }

    public HashMap<String, Object> insertImg(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        commonMapper.insertFile(map);
        resultMap.put("result", "success");
        return resultMap;
    }

    public HashMap<String, Object> selectImg(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<Common> imgList = commonMapper.selectFile(map);
        resultMap.put("imgList", imgList);
        resultMap.put("result", "success");
        return resultMap;

    }

}
