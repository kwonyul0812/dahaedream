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
        return mapper.updatePointByMemberId(point, memberId);
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
