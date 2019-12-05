package com.yzf.service;

import com.yzf.entity.Deptinfos;
import com.yzf.entity.Project;
import com.yzf.mapper.DeptinfosMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Author:yzf
 * Date:2019/11/4,17:36
 * project_name:xmwk
 **/
@Service
public class DeptinfoService {

    private DeptinfosMapper dept;

    @Autowired
    public void setDept(DeptinfosMapper dept) {
        this.dept = dept;
    }

    public int getcount(Integer type)
    {
        return Integer.parseInt(dept.getcount( type)+"");
    }

    public List<Deptinfos> showinfo(Integer type)
    {
        return dept.showinfo(type);
    }

    public Deptinfos upShow(int id)
    {
        return dept.upShow(id);
    }

    public int insert(String txt,String dname) {
        Deptinfos de=new Deptinfos();
        de.setDuty(txt);
        de.setDname(dname);
        return dept.insert(de);
    }

    public int update(String txt,String dname,int id)
    {
       Deptinfos de=new Deptinfos();
       de.setDuty(txt);
       de.setId(id);
       de.setDname(dname);
        return dept.update(de);
    }

    public int delete(int id)
    {
        return dept.delete(id);
    }

    public int deletes(String ids)
    {
        String[] split = ids.split(",");
        List<Integer> list=new ArrayList<>();
        for(int i=0;i<split.length;i++)
        {
            list.add(Integer.parseInt(split[i]));
        }
        return dept.deletes(list);
    }

    public int updateType(int type,int id)
    {
        return dept.updateType(type, id);
    }


}
