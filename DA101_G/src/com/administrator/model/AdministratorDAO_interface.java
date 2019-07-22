package com.administrator.model;

import java.util.*;

public interface AdministratorDAO_interface {
          public void insert(AdministratorVO administratorVO);
          public void update(AdministratorVO administratorVO);
          public void delete(Integer admin_no);
          public AdministratorVO findByPrimaryKey(Integer admin_no);
          public List<AdministratorVO> getAll();
          //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//        public List<EmpVO> getAll(Map<String, String[]> map); 
		void delete(String admin_no);
		AdministratorVO findByPrimaryKey(String admin_no);
}
