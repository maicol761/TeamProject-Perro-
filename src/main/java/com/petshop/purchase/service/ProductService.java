package com.petshop.purchase.service;

import java.util.List;

import com.petshop.purchase.dto.ProductVO;

import utils.Criteria;

public interface ProductService {
	
	List<ProductVO> getProductAllList(Criteria criteria,String pname);
	
	int getProductAllCount(String pname);
	
	ProductVO getProductDetail(ProductVO vo);
	
	List<ProductVO> getProductCnoList(Criteria criteria,int cno);
	
	int getProductCnoCount(int cno);
	
	
	//-------------------------------------------------------------------------------------	
	
	

	List<ProductVO> getProductList(ProductVO vo);
	
	void insertProduct(ProductVO vo);
	
	List<ProductVO> getlistProduct(String pname);

	ProductVO getlistProduct(ProductVO vo);
	
	
}