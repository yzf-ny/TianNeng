package com.yzf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzf.entity.action;
import com.yzf.service.ActionService;
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
@RequestMapping("action")
public class ActionCon {

    private ActionService service;

    @Autowired
    public void setAction(ActionService service) {
        this.service = service;
    }

    @ResponseBody
    @RequestMapping("/showinfo")
    public Map showinfo(int num, int count,int atype) {

        //第几页,每页大小
        PageHelper.startPage(num, count);
        List<com.yzf.entity.action> list = service.showinfo(atype);
        //分页
        PageInfo<action> page = new PageInfo<action>(list, 5);

        HashMap<String, Object> hashmap = new HashMap<>();
        hashmap.put("list", page.getList());
        hashmap.put("size", page.getPages());//总页数
        hashmap.put("arr", page.getNavigatepageNums());//页数数组
        hashmap.put("pagenum", page.getPageNum());//当前页数
        hashmap.put("row", service.getcount(atype));
        return hashmap;
    }

    @ResponseBody
    @RequestMapping("/insert")
    public int insert(String txt, String source, String title, String aimg,int type) {
        System.out.println("img:"+aimg);
        return service.insert(txt, source, title, aimg,type);
        //String txt,String source,String title,String aimg,int type
    }

    @ResponseBody
    @RequestMapping("/upShow")
    public com.yzf.entity.action upShow(int aid) {
        return service.upShow(aid);
    }

    @ResponseBody
    @RequestMapping("/update")
    public int update(String txt, String source, String title, String aimg,int type, int aid) {
        return service.update(txt, source, title, aimg, type,aid);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(int aid) {
        return service.delete(aid);
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public int deletes(String aids) {
        return service.deletes(aids);
    }

    @ResponseBody
    @RequestMapping("/upload")
    public int upload(@Nullable @RequestParam("file") MultipartFile file, HttpServletRequest request) {

        try {
            //得到当前项目路径（物理路径） F:\IDEA_test\springMvc\target\springMvc
            String realPath = request.getSession().getServletContext().getRealPath("/backstage/uplaod/");
            boolean directory = new File(realPath).isDirectory();
            //得到项目名
            String contextPath = request.getContextPath();
            //得到当前页面请求路径名称

            //保存文件，文件名原文件名
            file.transferTo(new File(realPath + file.getOriginalFilename()));
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }
    @ResponseBody
    @RequestMapping("/getAids")
    public List<action> getAids(int type,int aid)
    {
        return service.getAids(type,aid);
    }

    @ResponseBody
    @RequestMapping("/selectIds")
    public Integer selectIds(int type)
    {
        return service.selectIds(type);
    }
}
