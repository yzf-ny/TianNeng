package com.yzf.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sun.xml.internal.ws.spi.db.DatabindingException;

import java.util.Date;

public class Deptinfos {

    private Integer id;

    private int dtype;

    private String dname;

    public int getDtype() {
        return dtype;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public void setDtype(int dtype) {
        this.dtype = dtype;
    }

    public int getType() {
        return dtype;
    }

    public void setType(int dtype) {
        this.dtype = dtype;
    }

    private String duty;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date dtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public Date getDtime() {
        return dtime;
    }

    public void setDtime(Date dtime) {
        this.dtime = dtime;
    }
}