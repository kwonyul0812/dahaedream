package com.dahaedream.message.controller;

import com.dahaedream.auth.model.CustomUserDetails;
import com.dahaedream.login.model.MemberDto;
import com.dahaedream.message.model.MessageDto;
import com.dahaedream.message.service.MessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MessageController {

    private final MessageService service;

    @GetMapping("/message/receivedMessage")
    @PreAuthorize("isAuthenticated()")
    public String receivedMessage() {

        return "message/receivedMessage";
    }

    @GetMapping("/message/written")
    public String writtenMessage() {
        return "message/writtenMessage";
    }

    @GetMapping("/message/write")
    @PreAuthorize("isAuthenticated()")
    public String writeMessage() {
        return "message/messageWrite";
    }

    @GetMapping("/message/read")
    public String readMessage() {
        return "message/messageRead";
    }

    @GetMapping("/message/searchMember")
    @ResponseBody
    @PreAuthorize("isAuthenticated")
    public List<MemberDto> searchMember(@RequestParam String nickname) {
        List<MemberDto> members = service.getMembersByNickname(nickname);
        return members;
    }

    @PostMapping("/message/insert")
    @ResponseBody
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity insertMessage(@ModelAttribute MessageDto message,
                                        @AuthenticationPrincipal CustomUserDetails user) {
        message.setSenderId(user.getMemberId());
        int result = service.writeMessage(message);
        return null;
    }

}
