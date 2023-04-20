package com.petshop.beauty.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.beauty.dao.QnADAO;
import com.petshop.beauty.dto.AVO;
import com.petshop.beauty.dto.FaqVO;
import com.petshop.beauty.dto.QVO;

import utils.Criteria;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnADAO qnaDao;
	
	@Override
	public List<FaqVO> getFaqList(String catego) {
		return qnaDao.faqList(catego);
	}
	
	@Override
	public List<QVO> getQnaList(Criteria criteria, String mid) {
		return qnaDao.qnaList(criteria, mid);
	}

	@Override
	public QVO getQView(QVO vo) {
		return qnaDao.qView(vo);
	}

	@Override
	public AVO getAView(int qno) {
		return qnaDao.aView(qno);
	}

	@Override
	public void insertQ(QVO vo) {
		qnaDao.insertQ(vo);
	}

	@Override
	public int getACheck(int qno) {
		return qnaDao.aCheck(qno);
	}
	
	@Override
	public int getQnaCountMid(String mid) {
		return qnaDao.qnaCountMid(mid);
	}
	
}
