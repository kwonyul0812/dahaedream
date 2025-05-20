package com.dahaedream.message.mapper;

import com.dahaedream.login.model.MemberDto;
import com.dahaedream.message.model.MessageDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MessageMapper {
    List<MemberDto> selectMemberByNickname(String nickname);

    int insertMessage(MessageDto message);
}
