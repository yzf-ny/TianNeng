package com.yzf.mapper;

import com.yzf.entity.Culture;
import com.yzf.entity.Userinfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserinfoMapper {


    int deleteByPrimaryKey(Integer uid);


     Userinfo queryExists(@Param("email") String email,@Param("pwd") String pwd);

     //显示公司简介
     Culture queryculture();



     //添加日志
     int addlog(String name);


    int insert(Userinfo record);


    int updateCul(@Param("endtext") String endtext);


    int updateInfo(Userinfo user);
}