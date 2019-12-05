package com.yzf.service;

import com.yzf.entity.History;
import com.yzf.mapper.HistoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Author:yzf
 * Date:2019/11/5,9:50
 * project_name:xmwk
 **/
@Service
public class HistoryService {

    private HistoryMapper his;

    @Autowired
    public void setHis(HistoryMapper his) {
        this.his = his;
    }

    public int getcount()
    {
       return his.getcount();
    }

        public List<History> showinfo()
    {
        return his.showinfo();
    }

    public History upShow(int hid)
    {
        return his.upShow(hid);
    }

    public int insert(String txt,String time) {
        History h=new History();
        h.setHtext(txt);
        try {
            h.setHtime(new SimpleDateFormat("yyyy-MM-dd").parse(time));

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return his.insert(h);
    }

    public int update(String txt,String time,int hid)
    {
        History h=new History();
        h.setHtext(txt);
        h.setHid(hid);
        try {
            h.setHtime(new SimpleDateFormat("yyyy-MM-dd").parse(time));

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return his.update(h);
    }

    public int delete(int hid)
    {
        return his.delete(hid);
    }

    public int deletes(String hids)
    {
        //String s = hids.substring(0, hids.length() - 1);
        String[] split = hids.split(",");
        //Integer[] ins=new Integer[split.length];
        List<Integer> list=new ArrayList<>();
        for(int i=0;i<split.length;i++)
        {
            list.add(Integer.parseInt(split[i]));
        }
        return his.deletes(list);
    }

//    public static void main(String[] args) {
//        String hids="1,2,3,";
//        System.out.println(hids.substring(0,hids.length()-1));
//    }
}
