package com.dahaedream.mypage.controller;

import com.dahaedream.auth.model.CustomUserDetails;
import com.dahaedream.mypage.service.MypageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class MypageController {

    private final MypageService service;

    @GetMapping("/mypage/member")
    public String member() {
        return "mypage/member";
    }

    @GetMapping("/mypage/memberModify")
    public String memberModify() {
        return "mypage/memberModify";
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

    @PostMapping("/mypage/addPoint")
    @ResponseBody
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity addPoint(@RequestParam int point, @AuthenticationPrincipal CustomUserDetails user) {

        int result = service.addPoint(point, user.getMemberId());

        if(result > 0) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/mypage/getPoint")
    @ResponseBody
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity getPoint(@AuthenticationPrincipal CustomUserDetails user) {
        int point = service.getPoint(user.getMemberId());

        return ResponseEntity.ok().body(point);
    }
}
