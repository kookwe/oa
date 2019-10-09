package com.offcn.beans.daily;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Baoxiao {
    private String bxid;

    private String paymode;

    private Double totalmoney;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bxtime;

    private String bxremark;

    private String remark;

    private Integer bxstatus;

    private Integer empFk;

    private Integer caiwuFk;

    public String getBxid() {
        return bxid;
    }

    public void setBxid(String bxid) {
        this.bxid = bxid == null ? null : bxid.trim();
    }

    public String getPaymode() {
        return paymode;
    }

    public void setPaymode(String paymode) {
        this.paymode = paymode == null ? null : paymode.trim();
    }

    public Double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(Double totalmoney) {
        this.totalmoney = totalmoney;
    }

    public Date getBxtime() {
        return bxtime;
    }

    public void setBxtime(Date bxtime) {
        this.bxtime = bxtime;
    }

    public String getBxremark() {
        return bxremark;
    }

    public void setBxremark(String bxremark) {
        this.bxremark = bxremark == null ? null : bxremark.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getBxstatus() {
        return bxstatus;
    }

    public void setBxstatus(Integer bxstatus) {
        this.bxstatus = bxstatus;
    }

    public Integer getEmpFk() {
        return empFk;
    }

    public void setEmpFk(Integer empFk) {
        this.empFk = empFk;
    }

    public Integer getCaiwuFk() {
        return caiwuFk;
    }

    public void setCaiwuFk(Integer caiwuFk) {
        this.caiwuFk = caiwuFk;
    }
}