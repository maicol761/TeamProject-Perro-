package com.petshop.admin.service;

import java.util.List;

import com.petshop.purchase.dto.CategoryVO;

public interface PurchaseService {

	List<CategoryVO> CategoryList();

	CategoryVO catDetail(String cno);

	void catInsert(CategoryVO vo);

	int catUpdate(CategoryVO vo);

	int catDelete(CategoryVO vo);

}