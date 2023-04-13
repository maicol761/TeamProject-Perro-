package com.petshop.beauty.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.beauty.dto.DogVO;
import com.petshop.beauty.dto.ReservationVO;
import com.petshop.beauty.dto.ReservationViewVO;
import com.petshop.beauty.dto.ServiceVO;

import utils.Criteria;

@Repository
public class ReservationDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//예약 리스트
	public List<ReservationVO> getReservation(ReservationVO vo) {
		return mybatis.selectList("ReservationMapper.getReservation", vo);
	}
	
	//회원id 예약 리스트
		public List<ReservationViewVO> getRListMid(Criteria criteria,String mid) {
			HashMap<String, Object> map = new HashMap<>();
			
			map.put("criteria", criteria);
			map.put("mid", mid);
			
			return mybatis.selectList("ReservationMapper.rListMid", map);
		}
	
	//예약
	public void insertReservation(ReservationVO vo) {
		mybatis.insert("ReservationMapper.reservation", vo);
	}
	
	//겹치는 예약 체크
	public List<ReservationVO> reserCheck(ReservationVO vo){
		return mybatis.selectList("ReservationMapper.reserCheck", vo);
	}
	
	//견종 카테고리
	public List<DogVO> dog(){
		return mybatis.selectList("ReservationMapper.dogList");
	}
	
	//서비스 카테고리
	public List<ServiceVO> serviceList() {
		return mybatis.selectList("ReservationMapper.serviceList");
	}
	
	

}
