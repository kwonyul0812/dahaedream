package com.dahaedream.client.mapper;

import com.dahaedream.client.model.Client;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface ClientMapper {
    Client selectClient(HashMap<String, Object> map);
}
