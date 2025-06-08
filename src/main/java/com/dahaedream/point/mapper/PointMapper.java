package com.dahaedream.point.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface PointMapper {

    void increasePoint(HashMap<String, Object> map);

    void decreasePoint(HashMap<String, Object> map);

    void insertPointHistory(HashMap<String, Object> map);

}
