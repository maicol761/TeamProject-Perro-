package com.petshop.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.purchase.dao.ConfirmDAO;
import com.petshop.purchase.dto.ConfirmVO;
import com.petshop.purchase.dto.SalesQuantity;

import utils.Criteria;

@Service
public class ConfirmServiceImpl implements ConfirmService {
	@Autowired
	private ConfirmDAO confirmDAO;

	@Override
	public List<ConfirmVO> getConfirmAllList(Criteria criteria, String mid) {
		return confirmDAO.getConfirmAllList(criteria, mid);
	}
	@Override
	public int getConfirmAllCount(String mid) {
		return confirmDAO.getConfirmAllCount(mid);
	}
	@Override
	public List<SalesQuantity> getProductSales() {
		return confirmDAO.getProductSales();
	}
	@Override
	public void insertConfirm(ConfirmVO vo) {
		confirmDAO.insertConfirm(vo);
		
	}
	@Override
	public int getLastConfirm(String mid) {
		return confirmDAO.getLastConfirm(mid);
	}
	@Override
	public void confirmUpdate(int cono) {
		confirmDAO.confirmUpdate(cono);
	}
	@Override
	public List<ConfirmVO> getConfirmNowList(Criteria criteria, String mid) {
		return confirmDAO.getConfirmNowList(criteria, mid);
	}
	@Override
	public int getConfirmNowCount(String mid) {
		return confirmDAO.getConfirmNowCount(mid);
	}
	@Override
	public List<ConfirmVO> getConfirmPastList(Criteria criteria, String mid) {
		return confirmDAO.getConfirmPastList(criteria, mid);
	}
	@Override
	public int getConfirmPastCount(String mid) {
		return confirmDAO.getConfirmPastCount(mid);
	}
	@Override
	public ConfirmVO getConfirm(int cono) {
		return confirmDAO.getConfirm(cono);
	}
	@Override
	public void deleteConfirm(int cono) {
		confirmDAO.deleteConfirm(cono);
		
	}

}
