package com.dahaedream.message;

import com.dahaedream.jwt.model.CustomUserDetails;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MessageController {

    @GetMapping("/message/received")
    public String receivedMessage() {

        return "message/receivedMessage";
    }

    @GetMapping("/message/written")
    public String writtenMessage() {
        return "message/writtenMessage";
    }

    @GetMapping("/message/write")
    public String writeMessage() {
        return "message/messageWrite";
    }

    @GetMapping("/message/read")
    public String readMessage() {
        return "message/messageRead";
    }
}
