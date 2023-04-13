package com.petshop.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.admin.dao.MemberDAO;
import com.petshop.admin.dto.MemberVO;

import utils.Criteria;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;

	@Override
	public int join(MemberVO vo) {
		return dao.join(vo);
	}

	@Override
	public int loginCheck(MemberVO vo) {
		int r = dao.loginCheck(vo);
		// System.out.println(r);
		return r;
	}

	@Override
	public MemberVO memberdetail(MemberVO id) {
		return dao.memberdetail(id);
	}

	@Override
	public List<MemberVO> memberList(Criteria criteria) {
		return dao.memberList(criteria);
	}
	@Override
	public MemberVO memberdetail2(String id) {
		return dao.memberdetail2(id);
	}
	@Override
	public int memberDelete(MemberVO vo) {
	return dao.memberDelete(vo);
	}
	@Override
	public int memberUpdate(MemberVO vo) {
		return dao.memberUpdate(vo);
	}
	@Override
	public int idCheck(String mid) {
		return dao.idCheck(mid);
	}
	@Override
	public void pwdUpdate(MemberVO vo) {
		dao.pwdUpdate(vo);
	}
	@Override
	public int memberCount(Criteria critera) {
		return dao.memberCount(critera);
	}

	@Override
	public MemberVO getMemberLogin(MemberVO vo) {
		return dao.getMemberLogin(vo);
	}
}
