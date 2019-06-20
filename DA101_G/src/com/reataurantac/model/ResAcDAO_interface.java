package com.reataurantac.model;

import java.util.List;

public interface ResAcDAO_interface {
    public void insert(ResAcVO resAcVO);
    public void update(ResAcVO resAcVO);
    public void delete(String resac_no);
    public ResAcVO findByPrimaryKey(String resac_no,String resac_resno);
    public List<ResAcVO> getAll();
}
