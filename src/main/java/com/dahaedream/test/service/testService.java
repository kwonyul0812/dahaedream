package com.dahaedream.test.service;

import com.dahaedream.test.mapper.testMapper;
import com.dahaedream.test.model.testDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class testService {

    private final testMapper mapper;

    // mapper의 findAll 메소드 실행해 db에서 데이터 가져옴
    public List<testDto> getData() {
        return mapper.findAll();
    }
}
