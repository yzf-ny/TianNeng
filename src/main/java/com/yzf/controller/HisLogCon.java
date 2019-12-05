package com.yzf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzf.entity.Hislog;
import com.yzf.service.HistoryLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

/**
 * Author:yzf
 * Date:2019/11/4,9:11
 * project_name:xmwk
 **/
@Controller
public class HisLogCon {

    private HistoryLogService his;

    @Autowired
    public void setHis(HistoryLogService his) {
        this.his = his;
    }

    @ResponseBody
    @RequestMapping("/showhis")
    public HashMap<String, Object> show(int num) {
       // System.out.println("num=" + num);
        //第几页,每页大小
        PageHelper.startPage(num, 5);
        List<Hislog> list = his.showinfo();
        //分页
        PageInfo<Hislog> page = new PageInfo<>(list, 1);
        HashMap<String, Object> hashmap = new HashMap<>();
        hashmap.put("list", page.getList());
        hashmap.put("size", page.getPages());
        System.out.println("size:" + page.getPages() + "," + page.getPageNum());
        return hashmap;
    }




}
