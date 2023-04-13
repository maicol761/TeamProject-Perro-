package com.petshop.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.purchase.dao.ProductDAO;
import com.petshop.purchase.dto.ProductVO;

import utils.Criteria;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO pDao;
	
	@Override
	public void insertProduct(ProductVO vo) {
		
		pDao.insertProduct(vo);
	}
	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		return pDao.getProductList(vo);
	}
	
	@Override
	public List<ProductVO> getlistProduct(String pname) {
		
		return pDao.listProduct(pname);
	}
	@Override
	public ProductVO getlistProduct(ProductVO vo) {
	
		return pDao.getProduct(vo);
	}
	
//-------------------------------------------------------------------------------------	
	
	
	
	

	@Override
	public List<ProductVO> getProductAllList(Criteria criteria,String pname) {
		return pDao.getProductAllList(criteria,pname);
	}
	@Override
	public int getProductAllCount(String pname) {
		return pDao.getProductAllCount(pname);
	}
	@Override
	public ProductVO getProductDetail(ProductVO vo) {
		return pDao.getProductDetail(vo);
	}
	@Override
	public List<ProductVO> getProductCnoList(Criteria criteria, int cno) {
		return pDao.getProductCnoList(criteria, cno);
	}
	@Override
	public int getProductCnoCount(int cno) {
		return pDao.getProductCnoCount(cno);
	}


}
