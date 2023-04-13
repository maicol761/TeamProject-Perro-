package com.petshop.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.admin.dao.MypageDAO;
import com.petshop.admin.dto.ReservationListAllVO;
import com.petshop.beauty.dto.ReservationVO;

import utils.Criteria;
@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO dao;
	@Override
	public List<ReservationListAllVO> getreservationListAll(String id,Criteria criteria) {
		// TODO Auto-generated method stub
		return dao.reservationListAll(id,criteria);
	}
	@Override
	public int getrAllcount(String mid) {
		return dao.rAllcount(mid);
	}
	
	
	@Override
	public List<ReservationListAllVO> getNowReservationListAll(String id,Criteria criteria){
		return dao.nowReservationListAll(id,criteria);
	}
	@Override
	public int getRNowcount(String mid) {
		return dao.rNowcount(mid);
	}
	
	
	@Override
	public List<ReservationListAllVO> getPastReservationListAll(String id,Criteria criteria){
		return dao.pastReservationListAll(id,criteria);
	}
	@Override
	public int getRPastcount(String mid) {
		return dao.rPastcount(mid);
	}
	
	@Override
	public int reserDelete(int rno) {
	return dao.reserDelete(rno);
	}
	
//reserv---------------------------------------------------------------------------------------	
	
	
	
	
	
}
