package com.yzf.service;

import com.yzf.entity.Project;
import com.yzf.mapper.ProjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Author:yzf
 * Date:2019/11/6,13:02
 * project_name:xmwk
 **/
@Service
public class ProjectService {

    private ProjectMapper pro;

    @Autowired
    public void setPro(ProjectMapper pro) {
        this.pro = pro;
    }

    public int getcount() {
        return Integer.parseInt(pro.getcount() + "");
    }

    public List<Project> showinfo() {
        return pro.showinfo();
    }

    public Project upShow(int pid) {
        return pro.upShow(pid);
    }

    public int insert(String txt, String source, String name, String pimg) {
        Project sp = new Project();
        sp.setPname(name);
        sp.setPsource(source);
        sp.setPtext(txt);
        sp.setPimg(pimg);
        return pro.insert(sp);
    }

    public int update(String txt, String source, String name, String pimg, int pid) {
        Project sp = new Project();
        sp.setPname(name);
        sp.setPsource(source);
        sp.setPtext(txt);
        sp.setPid(pid);
        sp.setPimg(pimg);
        return pro.update(sp);
    }

    public int delete(int pid) {
        return pro.delete(pid);
    }

    public int deletes(String pids) {
        String[] split = pids.split(",");
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < split.length; i++) {
            list.add(Integer.parseInt(split[i]));
        }
        return pro.deletes(list);
    }

    //查询3条数据
    public List<Project> getPids(int pid) {
        return pro.getPids(pid);
    }

    //查询第一个pid
    public int selectIds() {
        return pro.selectIds();
    }

    public int updateNum(int num,int pid)
    {
        return pro.updateNum(num,pid);
    }

}
