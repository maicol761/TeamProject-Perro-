package com.petshop.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.purchase.dao.CartDAO;
import com.petshop.purchase.dto.CartVO;
import com.petshop.purchase.dto.CartViewVO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDao;

	@Override
	public void insertCart(CartVO vo) {
		cartDao.insertCart(vo);

	}

	@Override
	public List<CartViewVO> getListcart(String id) {

		return cartDao.listcart(id);
	}

	@Override
	public void deleteCart(int i) {

		cartDao.deleteCart(i);
	}

	@Override
	public void updateCart(CartVO vo) {
		
		cartDao.updateCart(vo);
	}

}
