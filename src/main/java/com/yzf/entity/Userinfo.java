package com.yzf.entity;

public class Userinfo {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userinfo.uid
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private Integer uid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userinfo.uname
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private String uname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userinfo.uemail
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private String uemail;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userinfo.upwd
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private String upwd;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userinfo.uphone
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private String uphone;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userinfo.uimg
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private String uimg;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userinfo.usex
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private Integer usex;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userinfo.uage
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private Integer uage;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userinfo.upower
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private Integer upower;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userinfo.uid
     *
     * @return the value of userinfo.uid
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userinfo.uid
     *
     * @param uid the value for userinfo.uid
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userinfo.uname
     *
     * @return the value of userinfo.uname
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public String getUname() {
        return uname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userinfo.uname
     *
     * @param uname the value for userinfo.uname
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userinfo.uemail
     *
     * @return the value of userinfo.uemail
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public String getUemail() {
        return uemail;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userinfo.uemail
     *
     * @param uemail the value for userinfo.uemail
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setUemail(String uemail) {
        this.uemail = uemail == null ? null : uemail.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userinfo.upwd
     *
     * @return the value of userinfo.upwd
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public String getUpwd() {
        return upwd;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userinfo.upwd
     *
     * @param upwd the value for userinfo.upwd
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setUpwd(String upwd) {
        this.upwd = upwd == null ? null : upwd.trim();
    }

    @Override
    public String toString() {
        return "Userinfo{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", uemail='" + uemail + '\'' +
                ", upwd='" + upwd + '\'' +
                ", uphone='" + uphone + '\'' +
                ", uimg='" + uimg + '\'' +
                ", usex=" + usex +
                ", uage=" + uage +
                ", upower=" + upower +
                '}';
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userinfo.uphone
     *
     * @return the value of userinfo.uphone
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public String getUphone() {
        return uphone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userinfo.uphone
     *
     * @param uphone the value for userinfo.uphone
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setUphone(String uphone) {
        this.uphone = uphone == null ? null : uphone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userinfo.uimg
     *
     * @return the value of userinfo.uimg
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public String getUimg() {
        return uimg;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userinfo.uimg
     *
     * @param uimg the value for userinfo.uimg
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setUimg(String uimg) {
        this.uimg = uimg == null ? null : uimg.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userinfo.usex
     *
     * @return the value of userinfo.usex
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public Integer getUsex() {
        return usex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userinfo.usex
     *
     * @param usex the value for userinfo.usex
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setUsex(Integer usex) {
        this.usex = usex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userinfo.uage
     *
     * @return the value of userinfo.uage
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public Integer getUage() {
        return uage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userinfo.uage
     *
     * @param uage the value for userinfo.uage
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setUage(Integer uage) {
        this.uage = uage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userinfo.upower
     *
     * @return the value of userinfo.upower
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public Integer getUpower() {
        return upower;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userinfo.upower
     *
     * @param upower the value for userinfo.upower
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setUpower(Integer upower) {
        this.upower = upower;
    }
}