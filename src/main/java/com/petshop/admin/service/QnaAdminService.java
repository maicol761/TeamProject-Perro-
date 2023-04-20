package com.petshop.admin.service;

import java.util.List;

import com.petshop.beauty.dto.AVO;
import com.petshop.beauty.dto.QVO;

import utils.Criteria;

public interface QnaAdminService {
	
	List<QVO> getQnaAllList(Criteria criteria,String acheck);
	
	int getQnaCount(String acheck);
	
	void insertA(AVO vo);
	
	void aUpdate(int qno);

}
