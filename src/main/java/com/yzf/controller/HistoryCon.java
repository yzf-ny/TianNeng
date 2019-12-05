package com.yzf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzf.entity.Hislog;
import com.yzf.entity.History;
import com.yzf.service.HistoryService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:yzf
 * Date:2019/11/5,9:51
 * project_name:xmwk
 **/
@Controller
@RequestMapping("/history")
public class HistoryCon {
    private HistoryService service;

    @Autowired
    public void setService(HistoryService service) {
        this.service = service;
    }

    @ResponseBody
    @RequestMapping("/showinfo")
    public Map showinfo(int num, int count) {

        //第几页,每页大小
        PageHelper.startPage(num, count);
        List<History> list = service.showinfo();
        //分页
        PageInfo<History> page = new PageInfo<History>(list, 5);

        HashMap<String, Object> hashmap = new HashMap<>();
        hashmap.put("list", page.getList());
        hashmap.put("size", page.getPages());//总页数
        hashmap.put("arr", page.getNavigatepageNums());//页数数组
        hashmap.put("pagenum", page.getPageNum());//当前页数
        hashmap.put("row", service.getcount());

        return hashmap;

    }

    @ResponseBody
    @RequestMapping("/insert")
    public int insert(String txt, String time) {
        return service.insert(txt, time);
    }

    @ResponseBody
    @RequestMapping("/upShow")
    public History upShow(int hid) {
        return service.upShow(hid);
    }

    @ResponseBody
    @RequestMapping("/update")
    public int update(String txt, String time, int hid) {
        return service.update(txt, time, hid);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(int hid) {
        return service.delete(hid);
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public int deletes(String hids) {
        return service.deletes(hids);
    }
}
