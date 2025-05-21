package com.dahaedream.message.service;

import com.dahaedream.login.model.MemberDto;
import com.dahaedream.message.mapper.MessageMapper;
import com.dahaedream.message.model.MessageDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MessageService {

    private final MessageMapper mapper;

    public List<MemberDto> getMembersByNickname(String nickname, int senderId) {
        return mapper.selectMemberByNickname(nickname,senderId);
    }

    public int writeMessage(MessageDto message) {
        return mapper.insertMessage(message);
    }

    public List<MessageDto> getSendedMessageList(int senderId) {
        return mapper.selectSendedMessageBySenderId(senderId);
    }

    public MessageDto getMessageDetails(int messageId, String type) {
        MessageDto message = null;
        if(type.equals("sended")) {
            message = mapper.selectSendedMessageByMessageId(messageId);
        } else if(type.equals("received")) {

        }

        return message;
    }
}
