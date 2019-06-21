package com.feasttrack.model;

import java.util.List;

import com.feastinfo.model.FeastInfoVO;

public interface FeastTrackDAO_interface
{
    public void insert(FeastTrackVO feastTrackVO);

    public void update(FeastTrackVO feastTrackVO);

    public void delete(String tra_feaNo, String tra_memNo);

    public FeastTrackVO findByPrimaryKey(String tra_feaNo, String tra_memNo);

    public List<FeastTrackVO> getAll();
}
