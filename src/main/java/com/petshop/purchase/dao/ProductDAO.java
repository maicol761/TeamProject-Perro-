package com.petshop.purchase.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.purchase.dto.ProductVO;

import utils.Criteria;

@Repository
public class ProductDAO{
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ProductVO> getProductAllList(Criteria criteria,String pname){
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("pname", pname);
		
		return mybatis.selectList("ProductMapper.getProductAllList",map);
	}
	public int getProductAllCount(String pname) {
		return mybatis.selectOne("ProductMapper.getProductAllCount",pname);
	}
	public ProductVO getProductDetail(ProductVO vo) {
		return mybatis.selectOne("ProductMapper.getProductDetail", vo);
	}
	
	public List<ProductVO> getProductCnoList(Criteria criteria,int cno){
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("cno", cno);
		
		return mybatis.selectList("ProductMapper.getProductCnoList",map);
	}
	public int getProductCnoCount(int cno) {
		return mybatis.selectOne("ProductMapper.getProductCnoCount",cno);
	}
	
	
	//-------------------------------------------------------------------------------------		
	
	
	
	
	
	
	
	
	public ProductVO getProduct(ProductVO vo) {
		return mybatis.selectOne("ProductMapper.getProduct", vo);
	}
	
	
	
	
	
	
	public List<ProductVO> getProductList(ProductVO vo) {
		return mybatis.selectList("ProductMapper.getProductList", vo);
	}
	
	//추가하기
	public void insertProduct(ProductVO vo) {
		
		mybatis.insert("ProductMapper.insertProduct", vo);
	}
	
	
	
	//조회하기
	public List<ProductVO> listProduct(String pname){
		return mybatis.selectList("ProductMapper.listProduct", pname);
	}

	

	
	
}
