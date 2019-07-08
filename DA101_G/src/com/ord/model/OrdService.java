package com.ord.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import com.ord_details.model.Ord_detailsVO;

public class OrdService {
	private OrdDAO_interface dao;

	public OrdService() {
		dao = new OrdDAO();
	}

	public OrdVO addOrd(String ord_fea_no, String ord_memno, String ord_resno, Integer ord_price, Timestamp ord_date,
			String ord_status, String ord_type) {
		OrdVO ordVO = new OrdVO();

		ordVO.setOrd_fea_no(ord_fea_no);
		ordVO.setOrd_memno(ord_memno);
		ordVO.setOrd_resno(ord_resno);
		ordVO.setOrd_price(ord_price);
		ordVO.setOrd_date(ord_date);
		ordVO.setOrd_status(ord_status);
		ordVO.setOrd_type(ord_type);

		dao.insert(ordVO);

		return ordVO;
	}

	public OrdVO updateOrd(String ord_no, String ord_fea_no, String ord_memno, String ord_resno, Integer ord_price,
			Timestamp ord_date, String ord_status, String ord_type) {
		OrdVO ordVO = new OrdVO();

		ordVO.setOrd_no(ord_no);
		ordVO.setOrd_fea_no(ord_fea_no);
		ordVO.setOrd_memno(ord_memno);
		ordVO.setOrd_resno(ord_resno);
		ordVO.setOrd_price(ord_price);
		ordVO.setOrd_date(ord_date);
		ordVO.setOrd_status(ord_status);
		ordVO.setOrd_type(ord_type);

		dao.update(ordVO);

		return ordVO;
	}

	public OrdVO getOneOrd(String ord_no) {
		return dao.findByPrimaryKey(ord_no);
	}

	public List<OrdVO> getAll() {
		return dao.getAll();
	}

	public Set<Ord_detailsVO> getOrdDetByOrdno(String ord_no) {
		return dao.getOrdDetByOrdno(ord_no);
	}

	public void addWithDetails(String ord_fea_no, String ord_memno, String ord_resno, Integer ord_price,
			Timestamp ord_date, String ord_status, String ord_type, List<Ord_detailsVO> list) {
		OrdVO ordVO = new OrdVO();
		
		
		ordVO.setOrd_fea_no(ord_fea_no);
		ordVO.setOrd_memno(ord_memno);
		ordVO.setOrd_resno(ord_resno);
		ordVO.setOrd_price(ord_price);
		ordVO.setOrd_date(ord_date);
		ordVO.setOrd_status(ord_status);
		ordVO.setOrd_type(ord_type);
		
		dao.insertWithDetails(ordVO, list);
	}
}
