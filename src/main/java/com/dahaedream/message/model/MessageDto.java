package com.dahaedream.message.model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class MessageDto {
    private int messageId;
    private int senderId;
    private int receiverId;
    private String nickname;
    private String title;
    private String content;
    private LocalDateTime sendDate;
    private boolean isRead;

    public boolean getIsRead() {
        return isRead;
    }
}