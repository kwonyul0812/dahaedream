package com.dahaedream.mypage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MypageMapper {
    int updatePointByMemberId(@Param("point") int point, @Param("memberId") int memberId);

    int selectPointByMemberId(@Param("memberId") int memberId);
}
