package com.leavemessage.model;

import java.util.List;

public interface LeavemessageDAO_interface {
	public void insert(LeavemessageVO LeavemessageVO);
	public void update(LeavemessageVO LeavemessageVO);
	public void delete(String lm_no);
	public LeavemessageVO findByPrimaryKey(String lm_no);
	public List<LeavemessageVO> getAll();

}
