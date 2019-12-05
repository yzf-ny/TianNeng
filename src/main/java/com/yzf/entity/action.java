package com.yzf.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Date;

/**
 * Author:yzf
 * Date:2019/10/31,15:18
 * project_name:xmwk
 **/

//动态
public class action {

    private int  aid ;
    private String atitle ;
    private String  asource ;
    @JsonFormat(pattern = "yyyy-MM-dd ")
    private Date atime ;
    private String  atext ;
    private int  atype ;
    private String aimg;

    public String getAimg() {
        return aimg;
    }

    public void setAimg(String aimg) {
        this.aimg = aimg;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAtitle() {
        return atitle;
    }

    public void setAtitle(String atitle) {
        this.atitle = atitle;
    }

    public String getAsource() {
        return asource;
    }

    public void setAsource(String asource) {
        this.asource = asource;
    }

    public Date getAtime() {
        return atime;
    }

    public void setAtime(Date atime) {
        this.atime = atime;
    }

    public String getAtext() {
        return atext;
    }

    public void setAtext(String atext) {
        this.atext = atext;
    }

    public int getAtype() {
        return atype;
    }

    public void setAtype(int atype) {
        this.atype = atype;
    }
}
