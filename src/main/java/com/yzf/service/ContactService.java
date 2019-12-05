package com.yzf.service;

import com.yzf.entity.Project;
import com.yzf.entity.contact;
import com.yzf.mapper.contactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Author:yzf
 * Date:2019/11/4,17:36
 * project_name:xmwk
 **/
@Service
public class ContactService {

    private contactMapper con;

    @Autowired
    public void setCon(contactMapper con) {
        this.con = con;
    }

    public int getcount()
    {
        return Integer.parseInt(con.getcount()+"");
    }

    public List<contact> showinfo()
    {
        return con.showinfo();
    }

    public contact upShow(int pid)
    {
        return con.upShow(pid);
    }

    public int insert(String phone,String fac,String qq,String email,String https,String coperate,String address) {
         contact co=new contact();
         co.setCphone(phone);
         co.setCfac(fac);
         co.setCqq(qq);
         co.setCemail(email);
         co.setChttps(https);
         co.setCoperate(coperate);
         co.setCaddress(address);
        return con.insert(co);
    }

    public int update(String phone,String fac,String qq,String email,String https,String coperate,String address,int cid)
    {
        contact co=new contact();
        co.setCphone(phone);
        co.setCfac(fac);
        co.setCqq(qq);
        co.setCemail(email);
        co.setChttps(https);
        co.setCoperate(coperate);
        co.setCaddress(address);
        co.setCid(cid);
        return con.update(co);
    }

    public int delete(int cid)
    {
        return con.delete(cid);
    }

    public int deletes(String cids)
    {
        String[] split = cids.split(",");
        List<Integer> list=new ArrayList<>();
        for(int i=0;i<split.length;i++)
        {
            list.add(Integer.parseInt(split[i]));
        }
        return con.deletes(list);
    }

}
