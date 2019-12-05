package com.yzf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzf.entity.Project;
import com.yzf.entity.Speak;
import com.yzf.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Author:yzf
 * Date:2019/11/6,13:02
 * project_name:xmwk
 **/
@Controller
@RequestMapping("project")
public class ProjectCon {
    private ProjectService pro;

    @Autowired
    public void setPro(ProjectService pro) {
        this.pro = pro;
    }

    @ResponseBody
    @RequestMapping("/showinfo")
    public Map showinfo(int num, int count) {

        //第几页,每页大小
        PageHelper.startPage(num, count);
        List<Project> list = pro.showinfo();
        //分页
        PageInfo<Project> page = new PageInfo<Project>(list, 5);

        HashMap<String, Object> hashmap = new HashMap<>();
        hashmap.put("list", page.getList());
        hashmap.put("size", page.getPages());//总页数
        hashmap.put("arr", page.getNavigatepageNums());//页数数组
        hashmap.put("pagenum", page.getPageNum());//当前页数
        hashmap.put("row", pro.getcount());

        return hashmap;

    }
    private String seid="";
    private Set<Integer> ids=new HashSet<>();
    @ResponseBody
    @RequestMapping("/getPids")
    public List<Project> getPids(int pid,HttpServletRequest request)
    {
        HttpSession session = request.getSession();

        //在同一时刻只能有一个访问
        synchronized (session){

            Integer i= (Integer)(session.getAttribute("count"));
           // System.out.println("session:"+session.getId());//E5D62062DBB9BA012D3BCE4EFD7B34AD

            boolean bl=true;

            for(Integer ir:ids)
            {
                int id=ir.intValue();
                System.out.println("id:"+id+",pid:"+pid);
                if(id==pid)
                    bl=false;
            }

            ids .add(pid);
            if(i==null)
            {

                System.out.println("this is 1");
                seid=session.getId();
                int  a=1;
                session.setAttribute("count",a);
                //修改浏览次数
                pro.updateNum(a,pid);
            }
            else{
               // System.out.println("s=s:"+(!seid.equals(session.getId())));
               //是否重复从同一个pid来访问

                System.out.println("bl="+bl);
                if( bl||!seid.equals(session.getId()))
                {
                    int a=1;
                    session.setAttribute("count",a);
                    //修改浏览次数
                    pro.updateNum(a,pid);
                }
            }
        }

        return pro.getPids(pid);
    }


    @ResponseBody
    @RequestMapping("/selecIds")
    public int selecIds()
    {
        return pro.selectIds();
    }

    @ResponseBody
    @RequestMapping("/insert")
    public int insert(String txt, String source, String name, String pimg) {
        return pro.insert(txt, source, name, pimg);
    }

    @ResponseBody
    @RequestMapping("/upShow")
    public Project upShow(int pid) {
        return pro.upShow(pid);
    }

    @ResponseBody
    @RequestMapping("/update")
    public int update(String txt, String source, String name, String pimg, int pid) {
        return pro.update(txt, source, name, pimg, pid);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(int pid) {
        return pro.delete(pid);
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public int deletes(String pids) {
        return pro.deletes(pids);
    }

    @ResponseBody
    @RequestMapping("/upload")
    public int upload(@Nullable @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        //System.out.println("file:" + file);
        try {
            //得到当前项目路径（物理路径） F:\IDEA_test\springMvc\target\springMvc
            String realPath = request.getSession().getServletContext().getRealPath("/backstage/uplaod/");
           // System.out.println("path:" + realPath);
            boolean directory = new File(realPath).isDirectory();
           // System.out.println(directory);
            //得到项目名
            String contextPath = request.getContextPath();
            //得到当前页面请求路径名称

            // String servletPath = request.getServletPath();
            //保存文件，文件名原文件名

            file.transferTo(new File(realPath + file.getOriginalFilename()));
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

}
