package com.dahaedream.message.mapper;

import com.dahaedream.login.model.MemberDto;
import com.dahaedream.message.model.MessageDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MessageMapper {
    List<MemberDto> selectMemberByNickname(@Param("nickname") String nickname,
                                           @Param("senderId") int senderId);

    int insertMessage(MessageDto message);

    List<MessageDto> selectSendedMessageBySenderId(@Param("senderId") int senderId);

    MessageDto selectSendedMessageByMessageId(@Param("messageId") int messageId);
}
