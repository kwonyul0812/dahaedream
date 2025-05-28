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


    @GetMapping("/message/list")
    @PreAuthorize("isAuthenticated()")
    public String sendedMessage(@RequestParam("type") String type,
                                @AuthenticationPrincipal CustomUserDetails user,
                                Model model) {
        int memberId = user.getMemberId();
        List<MessageDto> list = service.getMessageList(memberId, type);

        model.addAttribute("messageList", list);
        model.addAttribute("type", type);

        return "message/messageList";
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

    @GetMapping("/message/getMember")
    @ResponseBody
    @PreAuthorize("isAuthenticated()")
    public MemberDto getMember(@RequestParam int memberId) {
        return service.getMember(memberId);
    }

    @DeleteMapping("/message/delete")
    @ResponseBody
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity deleteMessage(@RequestParam int messageId) {
        int result = service.deleteMessage(messageId);

        if(result > 0) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.badRequest().build();
        }
    }
}
