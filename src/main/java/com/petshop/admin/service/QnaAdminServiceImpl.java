package com.petshop.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.beauty.dao.QnADAO;
import com.petshop.beauty.dto.AVO;
import com.petshop.beauty.dto.QVO;

import utils.Criteria;

@Service
public class QnaAdminServiceImpl implements QnaAdminService {
	
	@Autowired QnADAO qnadao;

	@Override
	public List<QVO> getQnaAllList(Criteria criteria, String acheck) {
		return qnadao.qnaAllList(criteria, acheck);
	}

	@Override
	public int getQnaCount(String acheck) {
		return qnadao.qnaCount(acheck);
	}

	@Override
	public void insertA(AVO vo) {
		qnadao.insertA(vo);
	}

	@Override
	public void aUpdate(int qno) {
		qnadao.aUpdate(qno);
	}

}
