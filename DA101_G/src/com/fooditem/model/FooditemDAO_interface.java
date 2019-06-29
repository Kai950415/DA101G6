package com.fooditem.model;

import java.util.List;

public interface FooditemDAO_interface {
	  public void insert(FooditemVO FooditemVO);
      public void update(FooditemVO FooditemVO);
      public void delete(String fo_no);
      public FooditemVO findByPrimaryKey(String fo_no);
      public List<FooditemVO> getAll();
      //萬用複合查詢(傳入參數型態Map)(回傳 List)
//    public List<EmpVO> getAll(Map<String, String[]> map); 
}

