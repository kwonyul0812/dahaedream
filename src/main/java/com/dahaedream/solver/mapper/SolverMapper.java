package com.dahaedream.solver.mapper;

import com.dahaedream.solver.model.Solver;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface SolverMapper {
    void insertRequestAccept(HashMap<String, Object> map);

    List<Solver> selectRequest(HashMap<String, Object> map);

    List<Solver> selectAcceptRequest(HashMap<String, Object> map);

    List<Solver> selectCompleteRequest(HashMap<String, Object> map);
}
