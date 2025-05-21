package com.dahaedream.common.controller;

import com.dahaedream.auth.model.CustomUserDetails;
import com.dahaedream.common.service.CommonService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequiredArgsConstructor
public class CommonController {

    private final CommonService commonService;

    @PostMapping("/common/category.dox")
    @ResponseBody
    public String getCategory(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = commonService.selectCategory(map);
        return new Gson().toJson(resultMap);
    }

    @PostMapping("/getMember.dox")
    @ResponseBody
    public String getMember(@AuthenticationPrincipal CustomUserDetails user) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("nickname", user.getNickname());
        resultMap.put("memberId", user.getMemberId());
        return new Gson().toJson(resultMap);
    }
}

