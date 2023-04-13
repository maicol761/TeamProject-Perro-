package com.petshop.beauty.service;

import java.util.List;

import com.petshop.beauty.dto.DogVO;
import com.petshop.beauty.dto.ReservationVO;
import com.petshop.beauty.dto.ReservationViewVO;
import com.petshop.beauty.dto.ServiceVO;

import utils.Criteria;

public interface ReservationService {

	void insertReservation(ReservationVO vo);
	
	List<ReservationVO> getReservation(ReservationVO vo);
	
	List<ReservationVO> getReserCheck(ReservationVO vo);
	
	List<DogVO> getDog();
	
	List<ServiceVO> getServiceList();
	
	List<ReservationViewVO> getRListMid(Criteria criteria,String mid);

}