package com.petshop.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.beauty.dto.DogVO;
import com.petshop.beauty.dto.ReservationVO;
import com.petshop.beauty.dto.ServiceVO;

import utils.Criteria;

@Repository
public class BeautyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<ReservationVO> rList(Criteria criteria) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("criteria", criteria);
		return mybatis.selectList("ReservationMapper.rList",map);
	}
	public List<DogVO> dogList(Criteria criteria) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("criteria", criteria);
		return mybatis.selectList("ReservationMapper.dogListPage",map);
	}
	
	public int rCount() {
		return mybatis.selectOne("ReservationMapper.rCount");
	}

	public DogVO dogDetail(int dno) {
		return mybatis.selectOne("ReservationMapper.dogDetail", dno);
	}

	public void dogInsert(DogVO vo) {
		mybatis.insert("ReservationMapper.dogInsert", vo);
	}

	public int dogUpdate(DogVO vo) {
		return mybatis.insert("ReservationMapper.dogUpdate", vo);
	}

	public int dogDelete(DogVO vo) {
		return mybatis.delete("ReservationMapper.dogDelete", vo);
	}

	public ServiceVO serviceDetail(String vo) {
		return mybatis.selectOne("ReservationMapper.serviceDetail", vo);
	}

	public int serviceUpdate(ServiceVO vo) {
		return mybatis.insert("ReservationMapper.serviceUpdate", vo);
	}

	public int serviceDelete(ServiceVO vo) {
		return mybatis.delete("ReservationMapper.serviceDelete", vo);
	}
	public void serviceInsert(ServiceVO vo) {
		mybatis.insert("ReservationMapper.serviceInsert", vo);
	}
	public int dCount() {
		return mybatis.selectOne("ReservationMapper.dCount");
	}
}
