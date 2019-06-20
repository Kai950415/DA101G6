package com.mem.modle;

import java.util.List;


public interface MemInterface {
    public void insert(MemVO memVO);
    public void update(MemVO memVO);
    public void delete(String mem_no);
    public MemVO findByPrimaryKey(String memNo);
    public List<MemVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<MemVO> getAll(Map<String, String[]> map); 
	

}
