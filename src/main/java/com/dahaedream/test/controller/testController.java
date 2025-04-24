package com.dahaedream.test.controller;

import com.dahaedream.test.model.testDto;
import com.dahaedream.test.service.testService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class testController {

    private final testService service;

    @GetMapping("/test")
    public String test(Model model) {
        // service에서 데이터 가져옴
        List<testDto> user = service.getData();

        model.addAttribute("testData", user);

        return "test";
    }

    @GetMapping("/test/data")
    @ResponseBody
    public List<testDto> testData() {
        List<testDto> user = service.findAjaxData();

        return user;
    }
}
