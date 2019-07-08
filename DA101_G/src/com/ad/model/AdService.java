package com.ad.model;

import java.sql.Timestamp;
import java.util.List;

public class AdService {
	private AdDAO_interface dao;
	
	public AdService() {
		dao = new AdDAO();
	}
	
	public AdVO addAd(String ad_resno,String ad_text,byte[] ad_img,Timestamp ad_start,Timestamp ad_end,String ad_title,String ad_status) {
		
		AdVO adVO = new AdVO();
		
		adVO.setAd_resno(ad_resno);
		adVO.setAd_text(ad_text);
		adVO.setAd_img(ad_img);
		adVO.setAd_start(ad_start);
		adVO.setAd_end(ad_end);
		adVO.setAd_title(ad_title);
		adVO.setAd_status(ad_status);
		
		dao.insert(adVO);
		
		return adVO;
	}
	
	public AdVO updateAd(String ad_no,String ad_resno,String ad_text,byte[] ad_img,Timestamp ad_start,Timestamp ad_end,String ad_title,String ad_status) {
		AdVO adVO = new AdVO();
		
		adVO.setAd_no(ad_no);
		adVO.setAd_resno(ad_resno);
		adVO.setAd_text(ad_text);
		adVO.setAd_img(ad_img);
		adVO.setAd_start(ad_start);
		adVO.setAd_end(ad_end);
		adVO.setAd_title(ad_title);
		adVO.setAd_status(ad_status);
		
		dao.update(adVO);
		
		return adVO;
	}
	
	public void deleteAd(String ad_no) {
		dao.delete(ad_no);
	}
	
	public AdVO getOneAd(String ad_no) {
		return dao.findByPrimaryKey(ad_no);
	}
	
	public List<AdVO> getAll(){
		return dao.getAll();
	}
}
