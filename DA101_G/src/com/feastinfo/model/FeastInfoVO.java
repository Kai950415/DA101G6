package com.feastinfo.model;

import java.io.Serializable;
import java.sql.Date;

public class FeastInfoVO implements Serializable
{
    private String fea_no;
    private String fea_resNo;
    private String fea_memNo;
    private String fea_title;
    private String fea_text;
    private Integer fea_number;
    private Integer fea_upLim;
    private Integer fea_lowLim;
    private Date fea_date;
    private Date fea_startDate;
    private Date fea_endDate;
    private String fea_type;
    private String fea_loc;
    private String fea_status;

    public String getFea_no()
    {
        return fea_no;
    }

    public void setFea_no(String fea_no)
    {
        this.fea_no = fea_no;
    }

    public String getFea_resNo()
    {
        return fea_resNo;
    }

    public void setFea_resNo(String fea_resNo)
    {
        this.fea_resNo = fea_resNo;
    }

    public String getFea_memNo()
    {
        return fea_memNo;
    }

    public void setFea_memNo(String fea_memNo)
    {
        this.fea_memNo = fea_memNo;
    }

    public String getFea_title()
    {
        return fea_title;
    }

    public void setFea_title(String fea_title)
    {
        this.fea_title = fea_title;
    }

    public String getFea_text()
    {
        return fea_text;
    }

    public void setFea_text(String fea_text)
    {
        this.fea_text = fea_text;
    }

    public Integer getFea_number()
    {
        return fea_number;
    }

    public void setFea_number(Integer fea_number)
    {
        this.fea_number = fea_number;
    }

    public Integer getFea_upLim()
    {
        return fea_upLim;
    }

    public void setFea_upLim(Integer fea_upLim)
    {
        this.fea_upLim = fea_upLim;
    }

    public Integer getFea_lowLim()
    {
        return fea_lowLim;
    }

    public void setFea_lowLim(Integer fea_lowLim)
    {
        this.fea_lowLim = fea_lowLim;
    }

    public Date getFea_date()
    {
        return fea_date;
    }

    public void setFea_date(Date fea_date)
    {
        this.fea_date = fea_date;
    }

    public Date getFea_startDate()
    {
        return fea_startDate;
    }

    public void setFea_startDate(Date fea_startDate)
    {
        this.fea_startDate = fea_startDate;
    }

    public Date getFea_endDate()
    {
        return fea_endDate;
    }

    public void setFea_endDate(Date fea_endDate)
    {
        this.fea_endDate = fea_endDate;
    }

    public String getFea_type()
    {
        return fea_type;
    }

    public void setFea_type(String fea_type)
    {
        this.fea_type = fea_type;
    }

    public String getFea_loc()
    {
        return fea_loc;
    }

    public void setFea_loc(String fea_loc)
    {
        this.fea_loc = fea_loc;
    }

    public String getFea_status()
    {
        return fea_status;
    }

    public void setFea_status(String fea_status)
    {
        this.fea_status = fea_status;
    }

}
