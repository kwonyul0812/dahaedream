package com.dahaedream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

    @GetMapping("/mypage/member")
    public String member() {
        return "mypage/member";
    }

    @GetMapping("/mypage/receivedReview")
    public String receivedReview() {
        return "mypage/receivedReview";
    }

    @GetMapping("/mypage/writtenReview")
    public String writtenReivew() {
        return "mypage/writtenReview";
    }

    @GetMapping("/mypage/point")
    public String point() {
        return "mypage/point";
    }

    @GetMapping("/mypage/pointHistory")
    public String pointHistory() {
        return "mypage/pointHistory";
    }
}
