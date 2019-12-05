package com.yzf.controller;


import com.yzf.entity.Culture;
import com.yzf.entity.Userinfo;
import com.yzf.service.UserinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Date;


/**
 * Author:yzf
 * Date:2019/10/31,14:45
 * project_name:xmwk
 **/
@Controller
public class UserinfoCon {

    private UserinfoService user;

    @Autowired
    public void setUser( UserinfoService user1) {
        this.user = user1;
    }

    @ResponseBody
    @RequestMapping("/islogin")
    public String islogin(@RequestParam("email") String email,@RequestParam("pwd") String pwd, HttpServletRequest request, HttpServletResponse response)
   {

       //System.out.println("email:"+email+",pwd:"+pwd);

       Userinfo u=user.show(email,pwd);
       try
       {
           if(u!=null)
           {
               request.getSession().setAttribute("userinfo",u);
               return 1+"";
           }
           else
           {
              return 0+"";
           }
       }catch (Exception e){
         e.getMessage();
       }
      return 0+"";
   }

   @ResponseBody
   @RequestMapping("updateInfo")
   public int updateInfo(HttpServletRequest request,int uid,String email,String name, String pwd,String phone,String img,Integer sex,Integer age)
   {
     int i= user.updateInfo(uid,email,name,pwd,phone,img,sex,age);
//       request.getSession().setAttribute("userinfo","");
//       return "redirect:login.jsp";
          return i;
   }

   @ResponseBody
   @RequestMapping("/updateCul")
   public Culture updateCul(@RequestParam("txt") String txt, HttpServletRequest request)
   {
       String ip=request.getHeader("x-forwarded-for");
       if (ip == null || "".equals(ip)) {
           ip = request.getRemoteAddr();
       }

       Object o = request.getSession().getAttribute("userinfo");
       Userinfo u=(Userinfo)o;
       int i = user.updateCul(txt,txt, u.getUname(),ip);
       return user.showculture();
   }

    //恢复公司简介
    @ResponseBody
    @RequestMapping("/recovery")
    public Culture recovery(String text) {
        int i = user.updateCul(text);
        return user.showculture();
    }

   @RequestMapping("/jumpindex")
   public String jumpindex()
   {
       return "redirect:backstage/index.jsp";
   }

   //显示公司简介
    @ResponseBody
   @RequestMapping("/showCu")
   public Culture showculture()
   {
       return user.showculture();
   }

   @RequestMapping("/backlogin")
   public String backlogin(HttpServletRequest request)
   {
       request.getSession().setAttribute("userinfo","");
       return "redirect:login.jsp";
   }

    @ResponseBody
    @RequestMapping("/upload")
    public int upload(@Nullable @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        //System.out.println("file:" + file);
        try {
            //得到当前项目路径（物理路径） F:\IDEA_test\springMvc\target\springMvc
            String realPath = request.getSession().getServletContext().getRealPath("/backstage/images/");
            boolean directory = new File(realPath).isDirectory();
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



//    public static void main(String[] args) {
//        UserinfoService user=new UserinfoService();
//        Userinfo u=user.show("123456@qq.com","123456");
//    }

}
