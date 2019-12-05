package com.yzf.service;

import com.yzf.entity.Hislog;
import com.yzf.mapper.HislogMapper;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import com.yzf.entity.Culture;
import com.yzf.entity.Userinfo;
import com.yzf.mapper.UserinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * Author:yzf
 * Date:2019/10/31,15:24
 * project_name:xmwk
 **/
@Service
public class UserinfoService {

    private UserinfoMapper user;
    private HislogMapper his;

    @Autowired
    public void setHis(HislogMapper his) {
        this.his = his;
    }

    @Autowired
    public void setUser(UserinfoMapper user) {
        this.user = user;
    }

    public Userinfo show(String email, String pwd) {
        System.out.println("email:"+email+" abc");
        return user.queryExists(email, pwd);
    }

    public int updateInfo(int uid,String email,String name, String pwd,String phone,String img,Integer sex,Integer age)
    {
      Userinfo us=new Userinfo();
      us.setUid(uid);
      us.setUage(age);
      us.setUemail(email);
      us.setUimg(img);
      us.setUname(name);
      us.setUphone(phone);
      us.setUpwd(pwd);
      us.setUsex(sex);
     return user.updateInfo(us);
    }

    //显示公司简介
    public Culture showculture() {
        return user.queryculture();
    }


    public int updateCul(String endtext, String begtext, String begname,String ip) {
        int i = user.updateCul(endtext);
        Hislog log = new Hislog();
        log.setHname(begname);
        log.setHtext(begtext);
        log.setHaddress(ip);
        int i1 = his.insert(log);
        return i + i1;
    }

    public int updateCul(String text)
    {
        int i = user.updateCul(text);
        return i;
    }

//    public static void main(String[] args) {
//        List<String> warnings = new ArrayList<String>();
//        boolean overwrite = true;
//        File configFile = new File("F:\\IDEA_test\\xmwk\\src\\main\\source\\mdg.xml");
//        ConfigurationParser cp = new ConfigurationParser(warnings);
//        Configuration config = null;
//        try {
//            config = cp.parseConfiguration(configFile);
//            DefaultShellCallback callback = new DefaultShellCallback(overwrite);
//            MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
//            myBatisGenerator.generate(null);
//        } catch (Exception e) {
//            e.printStackTrace();
//
//        }
//
//    }
}
