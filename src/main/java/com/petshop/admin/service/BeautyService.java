package com.petshop.admin.service;

import java.util.List;

import com.petshop.beauty.dto.DogVO;
import com.petshop.beauty.dto.ReservationVO;
import com.petshop.beauty.dto.ServiceVO;

import utils.Criteria;

public interface BeautyService {

	List<ReservationVO> rList(Criteria criteria);
	public DogVO dogDetail(int dno) ;
	public void dogInsert(DogVO vo) ;
	public int dogUpdate(DogVO vo);
	public int dogDelete(DogVO vo) ;
	public ServiceVO serviceDetail(String vo) ;
	public int serviceUpdate(ServiceVO vo) ;
	public int serviceDelete(ServiceVO vo) ;
	public void serviceInsert(ServiceVO vo);	
	public int rCount();
	public List<DogVO> dogList(Criteria criteria);
	public int dCount();
}