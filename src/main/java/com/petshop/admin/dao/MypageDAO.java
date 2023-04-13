package com.petshop.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.admin.dto.ReservationListAllVO;

import utils.Criteria;

@Repository
public class MypageDAO  {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<ReservationListAllVO> reservationListAll(String id,Criteria criteria){
		HashMap<String, Object> map = new HashMap<>();
		map.put("mid", id);
		map.put("criteria", criteria);
		return mybatis.selectList("ReservationMapper.reservationListAll", map);
	}
	public int rAllcount(String mid) {
		return mybatis.selectOne("ReservationMapper.rAllcount",mid);
	}
	
	
	
	public List<ReservationListAllVO> nowReservationListAll(String id,Criteria criteria){
		HashMap<String, Object> map = new HashMap<>();
		map.put("mid", id);
		map.put("criteria", criteria);
		return mybatis.selectList("ReservationMapper.nowReservationListAll", map);
	}
	public int rNowcount(String mid) {
		return mybatis.selectOne("ReservationMapper.rNowcount",mid);
	}
	
	
	
	
	public List<ReservationListAllVO> pastReservationListAll(String id,Criteria criteria){
		HashMap<String, Object> map = new HashMap<>();
		map.put("mid", id);
		map.put("criteria", criteria);
		return mybatis.selectList("ReservationMapper.pastReservationListAll", map);
	}
	public int rPastcount(String mid) {
		return mybatis.selectOne("ReservationMapper.rPastcount",mid);
	}
	
	
	
	
//reserv---------------------------------------------------------------------------------	
	
	
	public int reserDelete(int rno) {
		return mybatis.delete("ReservationMapper.reserDelete",rno);
	}
	
	
}
