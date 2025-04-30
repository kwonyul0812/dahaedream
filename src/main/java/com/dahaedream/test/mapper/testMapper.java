package com.dahaedream.test.mapper;

import com.dahaedream.test.model.testDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface testMapper {
    // test.xml에 작성된 쿼리 실행후 데이터 받음
    List<testDto> findAll();
    List<testDto> findAjax();
}
