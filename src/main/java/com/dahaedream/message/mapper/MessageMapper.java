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

    List<MessageDto> selectSendedMessageListBySenderId(@Param("senderId") int memberId);

    List<MessageDto> selectReceivedMessageListByReceiverId(@Param("receiverId") int memberId);

    MessageDto selectSendedMessageByMessageId(@Param("messageId") int messageId);

    MessageDto selectReceivedMessageByMessageId(@Param("messageId") int messageId);

    MemberDto selectMemberByMemberId(@Param("memberId") int memberId);

    int deleteMessageByMessageId(@Param("messageId") int messageId);

    int selectUnreadMessageCountByMemberId(@Param("memberId") int memberId);

    int updateReadStatus(@Param("messageId") int messageId);
}
