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

    public List<MemberDto> getMembersByNickname(String nickname) {
        return mapper.selectMemberByNickname(nickname);
    }

    public int writeMessage(MessageDto message) {
        return mapper.insertMessage(message);
    }
}
