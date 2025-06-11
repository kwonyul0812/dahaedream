package com.dahaedream.common.mapper;

import com.dahaedream.common.model.Common;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface CommonMapper {
    List<Common> selectCategory(HashMap<String, Object> map);

    void insertFile(HashMap<String, Object> map);

    List<Common> selectFile(HashMap<String, Object> map);

}
