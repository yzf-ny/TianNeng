package com.yzf.controller;

import com.yzf.entity.Userinfo;
import com.yzf.service.UserinfoService;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Author:yzf
 * Date:2019/11/4,17:36
 * project_name:xmwk
 **/
@Component
public class MyIntecepter implements HandlerInterceptor {

    private int i = 0;

    private UserinfoService user;

    private List<String> exceptUrls;

    public List<String> getExceptUrls() {
        return exceptUrls;
    }

    public void setExceptUrls(List<String> exceptUrls) {
        this.exceptUrls = exceptUrls;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        System.out.println("email:" + email + " ,pwd:" + pwd);
        Userinfo u = new Userinfo();

        String requestUri = request.getRequestURI();
        if (requestUri.startsWith(request.getContextPath())) {
            requestUri = requestUri.substring(request.getContextPath().length(), requestUri.length());
        }
        //系统根目录
        System.out.println("requestUri=" + requestUri);
        System.out.println("exceptUrls=" + exceptUrls);

        if (requestUri.equals(exceptUrls.get(0))) {

            return true;
        }
        try {
            u = (Userinfo) request.getSession().getAttribute("userinfo");

        } catch (Exception e) {

            request.getRequestDispatcher("login.jsp").forward(request, response);
            return false;
        }

        if (u == null) {
            System.out.println("return backlogin");
            //request.getRequestDispatcher("login.jsp").forward(request,response);
            response.sendRedirect("login.jsp");
            return false;
        } else {
            return true;
        }

    }

}
