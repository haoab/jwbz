package com.irs.pojo;

public class TbVisit {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_visit.id
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    private Long id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_visit.ip
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    private String ip;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_visit.url
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    private String url;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tb_visit.time
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    private String time;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_visit.id
     *
     * @return the value of tb_visit.id
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    public Long getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_visit.id
     *
     * @param id the value for tb_visit.id
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_visit.ip
     *
     * @return the value of tb_visit.ip
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    public String getIp() {
        return ip;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_visit.ip
     *
     * @param ip the value for tb_visit.ip
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_visit.url
     *
     * @return the value of tb_visit.url
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    public String getUrl() {
        return url;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_visit.url
     *
     * @param url the value for tb_visit.url
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tb_visit.time
     *
     * @return the value of tb_visit.time
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    public String getTime() {
        return time;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tb_visit.time
     *
     * @param time the value for tb_visit.time
     *
     * @mbggenerated Thu Sep 20 15:21:34 CST 2018
     */
    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }
}