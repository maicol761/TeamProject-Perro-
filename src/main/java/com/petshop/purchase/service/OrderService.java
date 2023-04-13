package com.petshop.purchase.service;

import java.util.List;

import com.petshop.purchase.dto.OrderResultViewVO;

import utils.Criteria;

public interface OrderService {
	
	
	List<OrderResultViewVO> getOrderResultlist(Criteria criteria,String mid);

	void insertOrder(String mid,int pno,int qty,int cono,String address,String phone);
	
	List<OrderResultViewVO> getOrderList(int cono);
	
	void deleteOrder(int cono);
}
