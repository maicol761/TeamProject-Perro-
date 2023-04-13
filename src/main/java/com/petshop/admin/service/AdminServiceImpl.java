package com.petshop.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.admin.dao.AdminDAO;
import com.petshop.admin.dto.MemberVO;

import utils.Criteria;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO dao;
	@Override
	public List<MemberVO> adminList(Criteria criteria) {
		// TODO Auto-generated method stub
		return dao.adminList(criteria);
	}
	@Override
	public MemberVO adminDetail(String mid) {
		return dao.adminDetail(mid);
	}
	@Override
	public int adminDelete(MemberVO vo) {
		return dao.adminDelete(vo);
	}
	@Override
	public int adminUpdate(MemberVO vo) {
		return dao.adminUpdate(vo);
	}
	@Override
	public int adminCount() {
		return dao.adminCount();
	}
}
