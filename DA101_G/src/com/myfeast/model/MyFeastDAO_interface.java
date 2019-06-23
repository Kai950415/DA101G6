package com.myfeast.model;

import java.util.List;

public interface MyFeastDAO_interface
{
    public void insert(MyFeastVO myFeastVO);

    public void update(MyFeastVO myFeastVOModified, MyFeastVO myFeastVOToBeModified);

    public void delete(String mye_feaNo, String mye_memNo);

    public MyFeastVO findByPrimaryKey(String mye_feaNo, String mye_memNo);

    public List<MyFeastVO> getAll();
}
