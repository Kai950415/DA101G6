package com.ord.model;

import java.util.List;

public interface OrdDAO_interface {
    public void insert(OrdVO ordVO);
    public void update(OrdVO ordVO);
    public void delete(String ord_no);
    public OrdVO findByPrimaryKey(String ord_no);
    public List<OrdVO> getAll();
}
