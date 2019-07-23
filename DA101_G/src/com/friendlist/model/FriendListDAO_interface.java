package com.friendlist.model;

import java.util.*;
import com.mem.model.MemVO;

public interface FriendListDAO_interface {
          public void insert(FriendListVO friendListVO);
//          public void update(FriendListVO friendListVO);
          public void reject(String F_NO,String F_MEMNO);
          public FriendListVO findByPrimaryKey(String F_NUM);
          
//          public int findByIds(String f_no,String f_memno);
//          public int findByIds2(String f_no,String f_memno);
          
          public List<MemVO> match(String mem_no);
          public List<MemVO> getAll(String mem_no);
          public List<MemVO> getAllInvite(String mem_no);
          public FriendListVO findByTwoPrimaryKey(String f_no, String f_memno);	
}
