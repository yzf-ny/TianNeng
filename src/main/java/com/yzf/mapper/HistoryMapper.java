package com.yzf.mapper;

import com.yzf.entity.History;
import org.apache.ibatis.annotations.Param;

import java.util.Arrays;
import java.util.List;

public interface HistoryMapper {


    int insert(History record);

    //显示所有信息
    List<History> showinfo();

   int getcount();

   History upShow(@Param("hid") int hid);

    int update(History record);

    int deletes(List<Integer> list);

    int delete(@Param("hid") int hid);
}