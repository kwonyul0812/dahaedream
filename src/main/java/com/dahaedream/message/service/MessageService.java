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
        return mapper.selectMemberByNickname(nickname, senderId);
    }

    public int writeMessage(MessageDto message) {
        return mapper.insertMessage(message);
    }

    public MessageDto getMessageDetails(int messageId, String type) {
        MessageDto message = null;
        if (type.equals("sended")) {
            message = mapper.selectSendedMessageByMessageId(messageId);
        } else if (type.equals("received")) {
            message = mapper.selectReceivedMessageByMessageId(messageId);
        }

        return message;
    }


    public List<MessageDto> getMessageList(int memberId, String type) {
        List<MessageDto> list = null;

        if (type.equals("sended")) {
            list = mapper.selectSendedMessageListBySenderId(memberId);
        } else if (type.equals("received")) {
            list = mapper.selectReceivedMessageListByReceiverId(memberId);
        }

        return list;
    }


    public MemberDto getMember(int memberId) {
        return mapper.selectMemberByMemberId(memberId);
    }
}
