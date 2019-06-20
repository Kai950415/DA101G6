package com.ord_details.model;

import java.util.List;


public interface Ord_detailsDAO_Interface {
    public void insert(Ord_detailsVO ord_detailsVO);
    public void update(Ord_detailsVO ord_detailsVO);
    public void delete(String det_ordno,String det_fono);
    public Ord_detailsVO findByPrimaryKey(String det_ordno,String det_fono);
    public List<Ord_detailsVO> getAll();
}
