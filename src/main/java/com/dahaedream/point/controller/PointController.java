package com.dahaedream.point.controller;

import com.dahaedream.point.service.PointService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequiredArgsConstructor
public class PointController {

    private final PointService pointService;

    @PostMapping("/point/deposit")
    @ResponseBody
    public String increasePoint(@RequestBody HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        pointService.increasePoint(map);
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/point/withdrawal")
    @ResponseBody
    public String decreasePoint(@RequestBody HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        pointService.decreasePoint(map);
        return new Gson().toJson(resultMap);
    }

}
