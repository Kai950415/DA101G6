package com.fooditem.model;

import java.util.List;
import java.util.stream.Collectors;



public class FooditemService {
	private FooditemDAO_interface fo;

	public FooditemService() {
		fo = new FooditemDAO();
	}

	public FooditemVO addFooditem(String fo_resno, String fo_name,
			int fo_price, byte[] fo_img, String fo_intro,String fo_status) {

		FooditemVO fooditemVO = new FooditemVO();

		fooditemVO.setFo_resno(fo_resno);
		fooditemVO.setFo_name(fo_name);
		fooditemVO.setFo_price(fo_price);
		fooditemVO.setFo_img(fo_img);
		fooditemVO.setFo_intro(fo_intro);
		fooditemVO.setFo_status(fo_status);
		fo.insert(fooditemVO);

		return fooditemVO;
	}

	
	
	public FooditemVO updateFooditem(String fo_no,String fo_resno, String fo_name,
			int fo_price, byte[] fo_img, String fo_intro,String fo_status) {

		FooditemVO fooditemVO = new FooditemVO();
		
		fooditemVO.setFo_no(fo_no);
		fooditemVO.setFo_resno(fo_resno);
		fooditemVO.setFo_name(fo_name);
		fooditemVO.setFo_price(fo_price);
		fooditemVO.setFo_img(fo_img);
		fooditemVO.setFo_intro(fo_intro);
		fooditemVO.setFo_status(fo_status);
		fo.update(fooditemVO);

		return fooditemVO;
	}
	public List<FooditemVO> getAllfooditemVOByFooditem(String fo_resno)
	{
		return fo.getAll().stream()
				.filter(fooditem -> fooditem.getFo_resno().equals(fo_resno))
				.collect(Collectors.toList());
	}
	

	public void deleteFooditem(String fo_no) {
		fo.delete(fo_no);
	}

	public FooditemVO getOneFooditem(String fo_no) {
		return fo.findByPrimaryKey(fo_no);
	}

	public List<FooditemVO> getAll() {
		return fo.getAll();
	}
	public List<FooditemVO> getByResNOFooditem(String fo_resno) {
		return fo.getByResNO(fo_resno);
	}
}

