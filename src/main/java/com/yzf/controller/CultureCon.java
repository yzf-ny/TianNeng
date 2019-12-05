package com.yzf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzf.entity.Culture;
import com.yzf.entity.Hislog;
import com.yzf.entity.Userinfo;
import com.yzf.service.CultureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * Author:yzf
 * Date:2019/11/4,17:37
 * project_name:xmwk
 **/
@Controller
public class CultureCon {

    private CultureService cul;

    @Autowired
    public void setCul(CultureService cul) {
        this.cul = cul;
    }

    @RequestMapping("/showinfo")
    @ResponseBody
    public Culture showinfo() {
        return cul.showinfo();
    }

    //修改culture表和添加hislog表
    @RequestMapping("/update")
    @ResponseBody
    public HashMap<String, Object> update(String txt, HttpServletRequest request) {
        //获得ip地址
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || "".equals(ip)) {
            ip = request.getRemoteAddr();
        }
        Object o = request.getSession().getAttribute("userinfo");
        Userinfo u = (Userinfo) o;

        int i = cul.update(txt, u.getUname(),ip);
        HashMap<String, Object> hs = new HashMap<>();
        hs.put("cul", cul.showinfo());
        hs.put("num", i);
        return hs;
    }

    @ResponseBody
    @RequestMapping("/showHisCul")
    public  HashMap<String, Object> showHisCul(int num) {
        //第几页,每页大小
        PageHelper.startPage(num, 5);
        List<Hislog> list = cul.showHisCul();
        //分页
        PageInfo<Hislog> page = new PageInfo<>(list, 1);
        HashMap<String, Object> hashmap = new HashMap<>();
        hashmap.put("list", page.getList());
        hashmap.put("size", page.getPages());
       // System.out.println("size:" + page.getPages() + "," + page.getPageNum());
        return hashmap;
    }

    //恢复之前的
    @ResponseBody
    @RequestMapping("/cover")
   public  HashMap<String, Object> cover(String txt)
   {
       int i = cul.cover(txt);
       HashMap<String, Object> hashmap = new HashMap<>();
       hashmap.put("list",cul.showinfo());
       hashmap.put("size",i);
       return hashmap;
   }

}
