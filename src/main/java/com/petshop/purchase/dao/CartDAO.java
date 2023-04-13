package com.petshop.purchase.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.purchase.dto.CartVO;
import com.petshop.purchase.dto.CartViewVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertCart(CartVO vo) {
		mybatis.insert("CartMapper.insertCart", vo);
	}

	public List<CartViewVO> listcart(String id) {
		return mybatis.selectList("CartMapper.listCart", id);
	}

	public void deleteCart(int i) {
	
		mybatis.delete("CartMapper.deleteCart",i);
	}
	public void updateCart(CartVO vo) {
		mybatis.update("CartMapper.updateCart", vo);
		
	}
}
