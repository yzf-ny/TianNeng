package com.yzf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzf.entity.Speak;
import com.yzf.service.SpeakService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:yzf
 * Date:2019/11/5,21:03
 * project_name:xmwk
 **/
@Controller
@RequestMapping("speack")
public class SpeakCon {

    private SpeakService speak;

    @Autowired
    public void setSpeak(SpeakService speak) {
        this.speak = speak;
    }

    @ResponseBody
    @RequestMapping("/showinfo")
    public Map showinfo(int num, int count) {

        //第几页,每页大小
        PageHelper.startPage(num, count);
        List<Speak> list = speak.showinfo();
        //分页
        PageInfo<Speak> page = new PageInfo<Speak>(list, 5);

        HashMap<String, Object> hashmap = new HashMap<>();
        hashmap.put("list", page.getList());
        hashmap.put("size", page.getPages());//总页数
        hashmap.put("arr", page.getNavigatepageNums());//页数数组
        hashmap.put("pagenum", page.getPageNum());//当前页数
        hashmap.put("row", speak.getcount());

        return hashmap;

    }

    @ResponseBody
    @RequestMapping("/insert")
    public int insert(String txt, String time,String name) {
        System.out.println("this is insert");
        System.out.println(name+","+time+","+txt);
        return speak.insert(txt, time,name);
    }

    @ResponseBody
    @RequestMapping("/upShow")
    public Speak upShow(int sid) {
        return speak.upShow(sid);
    }

    @ResponseBody
    @RequestMapping("/update")
    public int update(String txt, String time, String name,int sid) {
        return speak.update(txt, time,name,sid);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(int sid) {
        return speak.delete(sid);
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public int deletes(String sids) {
        return speak.deletes(sids);
    }
}
