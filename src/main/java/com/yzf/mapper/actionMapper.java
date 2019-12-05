package com.yzf.mapper;


import com.yzf.entity.action;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface actionMapper {

    int insert(action record);

    //显示所有信息
    List<action> showinfo(@Param("atype") int type);

    int getcount(@Param("atype")int type);

    action upShow(@Param("aid") int aid);

    int update(action record);

    int deletes(List<Integer> list);

    int delete(@Param("aid") int aid);

    List<action> getAids(@Param("atype") int type,@Param("aid") int aid);

    Integer selectIds(@Param("atype") int type);
}