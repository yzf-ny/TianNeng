package com.yzf.entity;

public class Culture {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column culture.cid
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private Integer cid;

    private String ctime;

    public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime;
    }

    @Override
    public String toString() {
        return "Culture{" +
                "cid=" + cid +
                ", csta=" + csta +
                ", ctext='" + ctext + '\'' +
                '}';
    }

    private Integer csta;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column culture.ctext
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    private String ctext;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column culture.cid
     *
     * @return the value of culture.cid
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public Integer getCid() {
        return cid;
    }


    public void setCid(Integer cid) {
        this.cid = cid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column culture.csta
     *
     * @return the value of culture.csta
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public Integer getCsta() {
        return csta;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column culture.csta
     *
     * @param csta the value for culture.csta
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setCsta(Integer csta) {
        this.csta = csta;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column culture.ctext
     *
     * @return the value of culture.ctext
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public String getCtext() {
        return ctext;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column culture.ctext
     *
     * @param ctext the value for culture.ctext
     *
     * @mbg.generated Thu Oct 31 15:16:35 CST 2019
     */
    public void setCtext(String ctext) {
        this.ctext = ctext == null ? null : ctext.trim();
    }
}