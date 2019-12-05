package com.yzf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzf.entity.Deptinfos;
import com.yzf.entity.Project;
import com.yzf.service.DeptinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:yzf
 * Date:2019/11/4,17:36
 * project_name:xmwk
 **/
@Controller
@RequestMapping("deptinfo")
public class DeptinfoCon {

    private DeptinfoService service;

    @Autowired
    public void setService(DeptinfoService service) {
        this.service = service;
    }

    @ResponseBody
    @RequestMapping("/showinfo")
    public Map showinfo(int num, int count,@Nullable Integer type) {

        //第几页,每页大小
        PageHelper.startPage(num, count);
        List<Deptinfos> list = service.showinfo(type);
        //分页
        PageInfo<Deptinfos> page = new PageInfo<Deptinfos>(list, 5);

        HashMap<String, Object> hashmap = new HashMap<>();
        hashmap.put("list", page.getList());
        hashmap.put("size", page.getPages());//总页数
        hashmap.put("arr", page.getNavigatepageNums());//页数数组
        hashmap.put("pagenum", page.getPageNum());//当前页数
        hashmap.put("row", service.getcount(type));
        return hashmap;
    }


    @ResponseBody
    @RequestMapping("/insert")
    public int insert(String txt,String dname) {
        return service.insert(txt,dname);
    }

    @ResponseBody
    @RequestMapping("/updateType")
    public int updateType(int type,int id) {
        return service.updateType(type,id);
    }

    @ResponseBody
    @RequestMapping("/upShow")
    public Deptinfos upShow(int id) {
        return service.upShow(id);
    }

    @ResponseBody
    @RequestMapping("/update")
    public int update(String txt, String dname,int id) {
        return service.update(txt,dname,id);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(int id) {
        return service.delete(id);
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public int deletes(String ids) {
        return service.deletes(ids);
    }

}
