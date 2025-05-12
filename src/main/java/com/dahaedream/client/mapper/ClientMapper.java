package com.dahaedream.client.mapper;

import com.dahaedream.client.model.Client;
import com.dahaedream.solver.model.Solver;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface ClientMapper {

    void insertRequest(HashMap<String, Object> map);

    List<Client> selectRequestList(HashMap<String, Object> map);

    Client selectInfo(HashMap<String, Object> map);

    int selectRequest(HashMap<String, Object> map);

    List<Solver> selectRequestAccept(HashMap<String, Object> map);
}
