package com.petshop.purchase.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.purchase.dto.OrderResultViewVO;

import utils.Criteria;
@Repository
public class OrderDAO  {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertOrder(String mid,int pno,int qty,int cono,String address,String phone) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("mid", mid);
		map.put("pno", pno);
		map.put("qty", qty);
		map.put("cono", cono);
		map.put("address", address);
		map.put("phone", phone);
		
		mybatis.insert("OrderMapping.insertOrder", map);
	}
	
	
	public List<OrderResultViewVO> orderResultlist(Criteria criteria,String mid){
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("mid", mid);
		
		return mybatis.selectList("OrderMapping.orderResultlist",map);
	}
	
	public List<OrderResultViewVO> getOrderList(int cono){
		
		return mybatis.selectList("OrderMapping.getOrderList",cono);
	}
	
	public void deleteOrder(int cono) {
		mybatis.delete("OrderMapping.deleteOrder", cono);
	}
	
	
	
}
