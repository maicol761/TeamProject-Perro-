package com.petshop.purchase.service;

import java.util.List;

import com.petshop.purchase.dto.CartVO;
import com.petshop.purchase.dto.CartViewVO;

public interface CartService {

	void insertCart(CartVO vo);

	List<CartViewVO> getListcart(String id);

	void deleteCart(int i);
	
	void updateCart(CartVO vo);

}