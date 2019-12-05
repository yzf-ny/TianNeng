package com.yzf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzf.entity.Deptinfos;
import com.yzf.entity.contact;
import com.yzf.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Author:yzf
 * Date:2019/11/4,17:36
 * project_name:xmwk
 **/

@Controller
@RequestMapping("contact")
public class ContactCon {
    private ContactService service;

    @Autowired
    public void setService(ContactService service) {
        this.service = service;
    }

    @ResponseBody
    @RequestMapping("/showinfo")
    public Map showinfo(int num, int count) {

        //第几页,每页大小
        PageHelper.startPage(num, count);
        List<contact> list = service.showinfo();
        //分页
        PageInfo<contact> page = new PageInfo<contact>(list, 5);

        HashMap<String, Object> hashmap = new HashMap<>();
        hashmap.put("list", page.getList());
        hashmap.put("size", page.getPages());//总页数
        hashmap.put("arr", page.getNavigatepageNums());//页数数组
        hashmap.put("pagenum", page.getPageNum());//当前页数
        hashmap.put("row", service.getcount());
        return hashmap;
    }


    @ResponseBody
    @RequestMapping("/insert")//String phone,String fac,String qq,String email,String https,String coperate,String address
    public int insert(String phone,String fac,String qq,String email,String https,String coperate,String address) {
        return service.insert(phone,fac,qq,email,https,coperate,address);
    }


    @ResponseBody
    @RequestMapping("/upShow")
    public contact upShow(int cid) {
        return service.upShow(cid);
    }

    @ResponseBody
    @RequestMapping("/update")////String phone,String fac,String qq,String email,String https,String coperate,String address
    public int update(String phone, String fac,String qq,String email,String https,String coperats,String address,int cid) {
        return service.update(phone,fac,qq,email,https,coperats,address,cid);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(int cid) {
        return service.delete(cid);
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public int deletes(String cids) {
        return service.deletes(cids);
    }
}
