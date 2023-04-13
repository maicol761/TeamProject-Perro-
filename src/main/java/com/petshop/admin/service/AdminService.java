package com.petshop.admin.service;

import java.util.List;

import com.petshop.admin.dto.MemberVO;

import utils.Criteria;

public interface AdminService {

	List<MemberVO> adminList(Criteria criteria);
	public MemberVO adminDetail(String mid);
	public int adminDelete(MemberVO vo) ;
	public int adminUpdate(MemberVO vo) ;
	public int adminCount() ;
}