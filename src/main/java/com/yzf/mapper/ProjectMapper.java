package com.yzf.mapper;

import com.yzf.entity.History;
import com.yzf.entity.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectMapper {

    int insert(Project record);

    //显示所有信息
    List<Project> showinfo();

    int getcount();

    Project upShow(@Param("pid") int pid);

    int update(Project record);

    int deletes(List<Integer> list);

    int delete(@Param("pid") int pid);

    List<Project> getPids(@Param("pid") int pid);

    int selectIds();

    int updateNum(@Param("pnum") int num,@Param("pid") int pid);

}