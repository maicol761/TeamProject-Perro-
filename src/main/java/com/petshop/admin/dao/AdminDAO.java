package com.petshop.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.admin.dto.MemberVO;

import utils.Criteria;

@Repository
public class AdminDAO  {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<MemberVO> adminList(Criteria criteria) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("criteria", criteria);
		return mybatis.selectList("AdminMapper.adminList",map);
	}
	
	public MemberVO adminDetail(String mid) {
		return mybatis.selectOne("AdminMapper.adminDetail", mid);
	}
	
	public int adminDelete(MemberVO vo) {
		return mybatis.delete("AdminMapper.adminDelete",vo);
	}
	public int adminUpdate(MemberVO vo) {
		return mybatis.update("AdminMapper.adminUpdate",vo);
	}
	
	public int adminCount() {
		return mybatis.selectOne("AdminMapper.adminCount");
	}
}
