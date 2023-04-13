package com.petshop.purchase.service;

import java.util.List;

import com.petshop.purchase.dto.ConfirmVO;
import com.petshop.purchase.dto.SalesQuantity;

import utils.Criteria;

public interface ConfirmService {

	List<ConfirmVO> getConfirmAllList(Criteria criteria, String mid);

	int getConfirmAllCount(String mid);
	
	List<SalesQuantity> getProductSales();
	
	void insertConfirm(ConfirmVO vo);
	
	int getLastConfirm(String mid);
	
	void confirmUpdate(int cono);
	
	List<ConfirmVO> getConfirmNowList(Criteria criteria,String mid);
	
	int getConfirmNowCount(String mid);
	
	List<ConfirmVO> getConfirmPastList(Criteria criteria,String mid);
	
	int getConfirmPastCount(String mid);
	
	ConfirmVO getConfirm(int cono);
	void deleteConfirm(int cono);

}