package com.dahaedream.login.mapper;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {

    Boolean isExistEmail(String email);

}
