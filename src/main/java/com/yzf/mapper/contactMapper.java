package com.yzf.mapper;

import com.yzf.entity.Project;
import com.yzf.entity.contact;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface contactMapper {

    int insert(contact record);

    //显示所有信息
    List<contact> showinfo();

    int getcount();

    contact upShow(@Param("cid") int cid);

    int update(contact record);

    int deletes(List<Integer> list);

    int delete(@Param("cid") int cid);


}