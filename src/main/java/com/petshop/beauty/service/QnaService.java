package com.petshop.beauty.service;

import java.util.List;

import com.petshop.beauty.dto.AVO;
import com.petshop.beauty.dto.FaqVO;
import com.petshop.beauty.dto.QVO;

import utils.Criteria;

public interface QnaService {
	
	//faq 리스트
	List<FaqVO> getFaqList(String catego);

	//질문 리스트
	List<QVO> getQnaList(Criteria criteria,String mid);
	int getQnaCountMid(String mid);
	
	//질문 조회
	QVO getQView(QVO vo);
	
	int getACheck(int qno);

	//답변 조회
	AVO getAView(int qno);
	
	void insertQ(QVO vo);

}