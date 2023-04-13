package com.petshop.beauty.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.beauty.dto.AVO;
import com.petshop.beauty.dto.FaqVO;
import com.petshop.beauty.dto.QVO;

import utils.Criteria;

@Repository
public class QnADAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//faq리스트
	public List<FaqVO> faqList(String catego){
		return mybatis.selectList("QnaMapper.faqList" ,catego);
	}

	//질문 리스트
	public List<QVO> qnaList(Criteria criteria,String mid){
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("mid", mid);
		
		return mybatis.selectList("QnaMapper.qnaList" ,map);
	}
	
	//총 질문 리스트
	public List<QVO> qnaAllList(Criteria criteria,String acheck){
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("acheck", acheck);
		
		return mybatis.selectList("QnaMapper.qnaAllList" ,map);
	}
	
	//질문 개수
	public int qnaCount(String acheck) {
		return mybatis.selectOne("QnaMapper.qnaCount",acheck);
	}
	
	//아이디별 질문 개수
	public int qnaCountMid(String mid) {
		return mybatis.selectOne("QnaMapper.qnaCountMid",mid);
	}
	
	//질문 조회
	public QVO qView(QVO vo) {
		return mybatis.selectOne("QnaMapper.qView", vo);
	}
	
	//답변 존재 여부
	public int aCheck(int qno) {
		return mybatis.selectOne("QnaMapper.aCheck", qno);
	}
	
	//답변 조회
	public AVO aView(int qno) {
		return mybatis.selectOne("QnaMapper.aView", qno);
	}
	
	//질문 등록
	public void insertQ(QVO vo) {
		mybatis.insert("QnaMapper.insertQ", vo);
	}
	
	public void insertA(AVO vo) {
		mybatis.insert("QnaMapper.insertA", vo);
	}
	
	public void aUpdate(int qno) {
		mybatis.update("QnaMapper.aUpdate", qno);
	}

}
