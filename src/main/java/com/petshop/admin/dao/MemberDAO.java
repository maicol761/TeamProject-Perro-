package com.petshop.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.admin.dto.MemberVO;

import utils.Criteria;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate mybatis;

	// 회원가입
	public int join(MemberVO vo) {
	 return	mybatis.insert("MemberMapper.join", vo);
	}
	// 회원 상세정보 조회
	public MemberVO memberdetail(MemberVO id) {

		return mybatis.selectOne("MemberMapper.memberDetail", id);
	}
	public MemberVO memberdetail2(String id) {

		return mybatis.selectOne("MemberMapper.memberDetail", id);
	}
	
	public MemberVO getMemberLogin(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.getMemberLogin", vo);
	}

	// 회원ID 존재 여부 확인
	public int idCheck(String mid) {
		String pwd = mybatis.selectOne("MemberMapper.idCheck", mid);

		if (pwd != null) {
			return 1; // id가 존재
		} else {
			return 0;
		}
	}

	// 회원 로그인 확인
	public int loginCheck(MemberVO vo) {
		System.out.println(vo.toString());
		int result = -1;
		String pwd = mybatis.selectOne("MemberMapper.idCheck", vo);
		//System.out.println(pwd);
		if (pwd == null) { // id가 존재하지 않음.
			result = -1;
		} else if (pwd.equals(vo.getMid())) { // 정상 로그인
			result = 1;
		} else {
			result = 0; // 비밀번호 불일치
		}

		return result;
	}

	public List<MemberVO> memberList(Criteria criteria){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("criteria", criteria);
		return mybatis.selectList("MemberMapper.memberList",map);
	}
	
	public int memberDelete(MemberVO vo) {
		return mybatis.delete("MemberMapper.memberDelete",vo);
	}
	public int memberUpdate(MemberVO vo) {
		return mybatis.update("MemberMapper.memberUpdate",vo);
	}
	public void pwdUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		mybatis.update("MemberMapper.pwdUpdate", vo);
	}
	
	public int memberCount(Criteria critera) {
		return mybatis.selectOne("MemberMapper.memberCount", critera);
	}
	
}
