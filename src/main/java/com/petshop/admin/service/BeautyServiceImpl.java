package com.petshop.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.admin.dao.BeautyDAO;
import com.petshop.beauty.dto.DogVO;
import com.petshop.beauty.dto.ReservationVO;
import com.petshop.beauty.dto.ServiceVO;

import utils.Criteria;

@Service
public class BeautyServiceImpl implements BeautyService {
	@Autowired
	private BeautyDAO dao;

	@Override
	public List<ReservationVO> rList(Criteria criteria) {
		// TODO Auto-generated method stub
		return dao.rList(criteria);
	}

	@Override
	public DogVO dogDetail(int dno) {
		return dao.dogDetail(dno);
	}

	@Override
	public void dogInsert(DogVO vo) {
		dao.dogInsert(vo);
	}

	@Override
	public int dogUpdate(DogVO vo) {

		return dao.dogUpdate(vo);
	}

	@Override
	public int dogDelete(DogVO vo) {

		return dao.dogDelete(vo);
	}

	@Override
	public ServiceVO serviceDetail(String vo) {
		return dao.serviceDetail(vo);
	}

	@Override
	public int serviceUpdate(ServiceVO vo) {
		return dao.serviceUpdate(vo);
	}

	@Override
	public int serviceDelete(ServiceVO vo) {
		return dao.serviceDelete(vo);
	}

	@Override
	public void serviceInsert(ServiceVO vo) {
		dao.serviceInsert(vo);
	}
	
	@Override
	public int rCount() {
		return dao.rCount();
	}
	@Override
	public List<DogVO> dogList(Criteria criteria) {
		return dao.dogList(criteria);
	}
	@Override
	public int dCount() {
		return dao.dCount();
	}
}
