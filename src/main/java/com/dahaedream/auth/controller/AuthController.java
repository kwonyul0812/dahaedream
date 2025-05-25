package com.dahaedream.auth.controller;

import com.dahaedream.auth.model.CustomUserDetails;
import com.dahaedream.message.service.MessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final MessageService messageService;

    @GetMapping("/auth/getUser")
    @ResponseBody
    public ResponseEntity getUser(@AuthenticationPrincipal CustomUserDetails user) {

        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        Map<String, Object> response = new HashMap<>();
        // 읽지않은 받은 쪽지 수 조회
        int msCount = messageService.getUnreadMessageCount(user.getMemberId());
        response.put("nickname", user.getNickname());
        response.put("msCount", msCount);

        return ResponseEntity.ok().body(response);
    }
}