package com.petshop.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.purchase.dao.OrderDAO;
import com.petshop.purchase.dto.OrderResultViewVO;

import utils.Criteria;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO dao;

	@Override
	public void insertOrder(String mid,int pno,int qty,int cono,String address,String phone) {
		dao.insertOrder(mid,pno,qty,cono,address,phone);
		
	}

	@Override
	public List<OrderResultViewVO> getOrderResultlist(Criteria criteria,String mid) {
		return dao.orderResultlist(criteria,mid);
	}

	@Override
	public List<OrderResultViewVO> getOrderList(int cono) {
		return dao.getOrderList(cono);
	}

	@Override
	public void deleteOrder(int cono) {
		dao.deleteOrder(cono);
	}


}
