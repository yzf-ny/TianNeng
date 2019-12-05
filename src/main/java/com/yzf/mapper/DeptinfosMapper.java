package com.yzf.mapper;

import com.yzf.entity.*;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface DeptinfosMapper {

    int insert(Deptinfos record);

    //显示所有信息
    List<Deptinfos> showinfo(@Param("atype") Integer type);

    int getcount(@Param("atype") Integer type);

    Deptinfos upShow(@Param("id") int id);

    int update(Deptinfos record);

    List<Deptinfos> selectType(@Param("atype") int atype);

    int deletes(List<Integer> list);

    int delete(@Param("id") int id);

    int updateType(@Param("atype") int atype,@Param("id") int id);
}