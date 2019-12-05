package com.yzf.service;

import com.yzf.entity.Project;
import com.yzf.entity.action;
import com.yzf.mapper.actionMapper;
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
public class ActionService {

  private actionMapper action;

  @Autowired
    public void setAction(actionMapper action) {
        this.action = action;
    }

    public int getcount(int type)
    {
        return Integer.parseInt(action.getcount(type)+"");
    }

    public List<com.yzf.entity.action> showinfo(int type)
    {
        return action.showinfo(type);
    }

    public com.yzf.entity.action upShow(int aid)
    {
        return action.upShow(aid);
    }

    public int insert(String txt,String source,String title,String aimg,int type) {
       action ac=new action();
       ac.setAsource(source);
       ac.setAtext(txt);
       ac.setAtitle(title);
       ac.setAtype(type);
       ac.setAimg(aimg);
        return action.insert(ac);
    }

    public int update(String txt,String source,String title,String aimg,int type,int aid)
    {
        action ac=new action();
        ac.setAsource(source);
        ac.setAtext(txt);
        ac.setAtitle(title);
        ac.setAtype(type);
        ac.setAimg(aimg);
        ac.setAid(aid);
        return action.update(ac);
    }

    public int delete(int aid)
    {
        return action.delete(aid);
    }

    public int deletes(String aids)
    {
        String[] split = aids.split(",");
        List<Integer> list=new ArrayList<>();
        for(int i=0;i<split.length;i++)
        {
            list.add(Integer.parseInt(split[i]));
        }
        return action.deletes(list);
    }

    public List<action> getAids(int type,int aid)
    {
        return action.getAids(type,aid);
    }

    public Integer selectIds(int type){return action.selectIds(type);}

}
