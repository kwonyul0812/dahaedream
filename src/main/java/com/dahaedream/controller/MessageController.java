package com.dahaedream.controller;

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
