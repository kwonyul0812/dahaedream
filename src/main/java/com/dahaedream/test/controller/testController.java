package com.dahaedream.test.controller;

import com.dahaedream.jwt.model.CustomUserDetails;
import com.dahaedream.test.model.testDto;
import com.dahaedream.test.service.testService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
//        List<testDto> user = service.getData();

//        model.addAttribute("testData", user);

        return "test";
    }

    @GetMapping("/test/data")
    @ResponseBody
    public List<testDto> testData() {
        List<testDto> user = service.findAjaxData();

        return user;
    }

    @GetMapping("/test/jwtTest")
    @ResponseBody
    public String jwtTest() {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // getPrincipal()이 CustomUserDetails 객체인 경우
        if (authentication != null && authentication.getPrincipal() instanceof CustomUserDetails) {
            CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
            int memberId = userDetails.getMemberId();
            String nickname = userDetails.getNickname();

            return "testController: memberId = " + memberId + ", nickname = " + nickname;
        } else {
            return "No authenticated user";
        }
    }
}
