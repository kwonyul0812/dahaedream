package com.dahaedream.mypage.mapper;

import com.dahaedream.mypage.model.PointHistoryDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MypageMapper {
    int updatePointByMemberId(@Param("point") int point, @Param("memberId") int memberId);

    int selectPointByMemberId(@Param("memberId") int memberId);

    List<PointHistoryDto> selectPointHistoryByMemberId(@Param("memberId") int memberId);

    int insertPointHistory(@Param("memberId") int memberId,@Param("point") int point,@Param("pointType") String pointType,@Param("changedPoint") int changedPoint);
}
