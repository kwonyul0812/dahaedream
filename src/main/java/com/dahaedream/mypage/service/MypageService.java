package com.dahaedream.mypage.service;


import com.dahaedream.mypage.mapper.MypageMapper;
import com.dahaedream.mypage.model.PointHistoryDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MypageService {

    private final MypageMapper mapper;

    public int addPoint(int point, int memberId) {
        int result = mapper.updatePointByMemberId(point, memberId);

        if (result > 0) {
            int changedPoint = mapper.selectPointByMemberId(memberId);
            mapper.insertPointHistory(memberId, point, "충전", changedPoint);
            return 1;
        } else {
            return 0;
        }
    }

    public int getPoint(int memberId) {
        return mapper.selectPointByMemberId(memberId);
    }

    public List<PointHistoryDto> getPointHistoryList(int memberId) {
        List<PointHistoryDto> pointHistoryList = mapper.selectPointHistoryByMemberId(memberId);

        for (PointHistoryDto pointHistory : pointHistoryList) {
            pointHistory.setFormattedUpdateTime();
        }

        return pointHistoryList;
    }
}
