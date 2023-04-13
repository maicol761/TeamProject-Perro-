package com.petshop.beauty.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.petshop.beauty.dao.ReservationDAO;
import com.petshop.beauty.dto.DogVO;
import com.petshop.beauty.dto.ReservationVO;
import com.petshop.beauty.dto.ReservationViewVO;
import com.petshop.beauty.dto.ServiceVO;

import utils.Criteria;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO rDao;

	@Override
	public void insertReservation(ReservationVO vo) {
		rDao.insertReservation(vo);
	}

	@Override
	public List<ReservationVO> getReservation(ReservationVO vo) {
		return rDao.getReservation(vo);
	}
	
	@Override
	public List<ReservationVO> getReserCheck(ReservationVO vo) {
		return rDao.reserCheck(vo);
	}

	@Override
	public List<DogVO> getDog() {
		return rDao.dog();
	}

	@Override
	public List<ServiceVO> getServiceList() {
		return rDao.serviceList();
	}

	@Override
	public List<ReservationViewVO> getRListMid(Criteria criteria,String mid) {
		return rDao.getRListMid(criteria,mid);
	}

	

}