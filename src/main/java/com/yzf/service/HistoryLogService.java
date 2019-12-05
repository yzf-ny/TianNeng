package com.yzf.service;

import com.yzf.entity.Hislog;
import com.yzf.mapper.HislogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Author:yzf
 * Date:2019/11/4,9:08
 * project_name:xmwk
 **/
@Service
public class HistoryLogService {

    private HislogMapper his;

    @Autowired
    public void setHis(HislogMapper his) {
        this.his = his;
    }

     public List<Hislog> showinfo()
     {
         return his.showinfo();
     }

}
