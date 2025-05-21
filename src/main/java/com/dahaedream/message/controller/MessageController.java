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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MessageController {

    private final MessageService service;

    @GetMapping("/message/received")
    @PreAuthorize("isAuthenticated()")
    public String receivedMessage() {

        return "message/receivedMessage";
    }

    @GetMapping("/message/sended")
    @PreAuthorize("isAuthenticated()")
    public String writtenMessage(@AuthenticationPrincipal CustomUserDetails user, Model model) {
        int senderId = user.getMemberId();
        List<MessageDto> list = service.getSendedMessageList(senderId);
        System.out.println(list);

        model.addAttribute("sendedMessageList", list);

        return "message/sendedMessage";
    }

    @GetMapping("/message/write")
    @PreAuthorize("isAuthenticated()")
    public String writeMessage() {
        return "message/messageWrite";
    }

    @GetMapping("/message/read")
    @PreAuthorize("isAuthenticated()")
    public String readMessage(@RequestParam("messageId") int messageId,
                              @RequestParam("type") String type,
                              Model model) {

        MessageDto message = service.getMessageDetails(messageId, type);

        model.addAttribute("message", message);
        model.addAttribute("type", type);

        return "message/messageRead";
    }

    @GetMapping("/message/searchMember")
    @ResponseBody
    @PreAuthorize("isAuthenticated")
    public List<MemberDto> searchMember(@RequestParam String nickname,
                                        @AuthenticationPrincipal CustomUserDetails user) {
        List<MemberDto> members = service.getMembersByNickname(nickname, user.getMemberId());
        return members;
    }

    @PostMapping("/message/insert")
    @ResponseBody
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity insertMessage(@ModelAttribute MessageDto message,
                                        @AuthenticationPrincipal CustomUserDetails user) {
        message.setSenderId(user.getMemberId());
        int result = service.writeMessage(message);
        if (result == 1) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.badRequest().build();
        }
    }

}
