package com.reportfeast.model;

import java.util.List;

import com.feastinfo.model.FeastInfoVO;
import com.myfeast.model.MyFeastVO;

public interface ReportFeastDAO_interface
{
    
//    private String repofea_no;
//    private String repofea_feaNo;
//    private String repofea_memNo;
//    private String repofea_text;
    
    public void insert(ReportFeastVO reportFeastVO);

    public void update(ReportFeastVO reportFeastVO);

    public void delete(String repofea_no);

    public ReportFeastVO findByPrimaryKey(String repofea_no);

    public List<ReportFeastVO> getAll();
}
