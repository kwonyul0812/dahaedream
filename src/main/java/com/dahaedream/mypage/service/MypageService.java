package com.dahaedream.mypage.service;


import com.dahaedream.mypage.mapper.MypageMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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
}
