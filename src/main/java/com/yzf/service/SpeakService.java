package com.yzf.service;

import com.yzf.entity.History;
import com.yzf.entity.Speak;
import com.yzf.mapper.SpeakMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Author:yzf
 * Date:2019/11/5,21:03
 * project_name:xmwk
 **/
@Service
public class SpeakService {

    private SpeakMapper speak;

    @Autowired
    public void setSpeak(SpeakMapper speak) {
        this.speak = speak;
    }

    public int getcount()
    {
        return Integer.parseInt(speak.getcount()+"");
    }

    public List<Speak> showinfo()
    {
        return speak.showinfo();
    }

    public Speak upShow(int hid)
    {
        return speak.upShow(hid);
    }

    public int insert(String txt,String time,String name) {
        Speak sp=new Speak();
        sp.setSname(name);
        sp.setStext(txt);
        try {
            sp.setStime(new SimpleDateFormat("yyyy-MM-dd").parse(time));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return speak.insert(sp);
    }

    public int update(String txt,String time,String name,int sid)
    {
        Speak sp=new Speak();
        sp.setSid(sid);
        sp.setSname(name);
        sp.setStext(txt);
        try {
            sp.setStime(new SimpleDateFormat("yyyy-MM-dd").parse(time));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return speak.update(sp);

    }

    public int delete(int hid)
    {
        return speak.delete(hid);
    }

    public int deletes(String hids)
    {
        String[] split = hids.split(",");
        List<Integer> list=new ArrayList<>();
        for(int i=0;i<split.length;i++)
        {
            list.add(Integer.parseInt(split[i]));
        }
        return speak.deletes(list);
    }


}
