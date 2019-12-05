package com.yzf.mapper;

import com.yzf.entity.History;
import com.yzf.entity.Speak;
import com.yzf.entity.SpeakExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SpeakMapper {


    int insert(Speak record);

    //显示所有信息
    List<Speak> showinfo();

    int getcount();

    Speak upShow(@Param("sid") int sid);

    int update(Speak record);

    int deletes(List<Integer> list);

    int delete(@Param("sid") int sid);

}