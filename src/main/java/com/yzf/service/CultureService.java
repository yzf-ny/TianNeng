package com.yzf.service;

import com.yzf.entity.Culture;
import com.yzf.entity.Hislog;
import com.yzf.mapper.CultureMapper;
import com.yzf.mapper.HislogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Author:yzf
 * Date:2019/11/4,17:36
 * project_name:xmwk
 **/
@Service
public class CultureService {

    private CultureMapper cul;
    private HislogMapper his;

    @Autowired
    public void setHis(HislogMapper his) {
        this.his = his;
    }

    @Autowired
    public void setCul(CultureMapper cul) {
        this.cul = cul;
    }

    public Culture showinfo()
    {
        return cul.showinfo();
    }

    public int update(String text,String name,String ip)
    {
        Hislog hislog=new Hislog();
        hislog.setHaddress(ip);
        hislog.setHname(name);
        hislog.setHtext(text);
        hislog.setHtime(new Date());
        int i = his.insert1(hislog);
        //System.out.println("i="+i);
        int i1 = cul.update(text);
       // System.out.println("i1="+i1);
        return i+i1;
    }
    //显示log信息
    public List<Hislog> showHisCul()
    {
        return cul.showhisCul();
    }

    //还原之前的文件
    public int cover(String txt)
    {
        return  cul.update(txt);
    }
}
