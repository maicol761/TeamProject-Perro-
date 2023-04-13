package com.petshop.admin.service;

import java.util.List;

import com.petshop.admin.dto.MemberVO;

import utils.Criteria;

public interface MemberService {

	// 회원가입
	int join(MemberVO vo);
	
	public int loginCheck(MemberVO vo) ;

	// 회원 상세정보 조회
	public MemberVO memberdetail(MemberVO id) ;
	
	public List<MemberVO> memberList(Criteria criteria);
	public MemberVO memberdetail2(String id) ;
	public int memberDelete(MemberVO vo) ;
	public int memberUpdate(MemberVO vo) ;
	public int idCheck(String mid) ;
	void pwdUpdate(MemberVO vo);
	public int memberCount(Criteria critera) ;
	
	
	MemberVO getMemberLogin(MemberVO vo);

}