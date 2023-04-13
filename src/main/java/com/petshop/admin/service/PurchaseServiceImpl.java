package com.petshop.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.admin.dao.PurchaseDAO;
import com.petshop.purchase.dto.CategoryVO;
@Service
public class PurchaseServiceImpl implements PurchaseService {
	@Autowired
	private PurchaseDAO dao;
	@Override
	public List<CategoryVO> CategoryList() {
		// TODO Auto-generated method stub
		return dao.CategoryList();
	}

	@Override
	public CategoryVO catDetail(String cno) {
		// TODO Auto-generated method stub
		return dao.catDetail(cno);
	}

	@Override
	public void catInsert(CategoryVO vo) {
		// TODO Auto-generated method stub
		dao.catInsert(vo);
	}

	@Override
	public int catUpdate(CategoryVO vo) {
		// TODO Auto-generated method stub
		return dao.catUpdate(vo);
	}

	@Override
	public int catDelete(CategoryVO vo) {
		// TODO Auto-generated method stub
		return dao.catDelete(vo);
	}

}
