package com.petshop.admin.service;

import java.util.List;

import com.petshop.admin.dto.ReservationListAllVO;
import com.petshop.beauty.dto.ReservationVO;

import utils.Criteria;

public interface MypageService {

	List<ReservationListAllVO> getreservationListAll(String id,Criteria criteria);
	int getrAllcount(String mid) ;
	
	List<ReservationListAllVO> getNowReservationListAll(String id,Criteria criteria);
	int getRNowcount(String mid);
	
	
	List<ReservationListAllVO> getPastReservationListAll(String id,Criteria criteria);
	int getRPastcount(String mid);
	
	
	int reserDelete(int rno);
	
	
	
	
	
	
}