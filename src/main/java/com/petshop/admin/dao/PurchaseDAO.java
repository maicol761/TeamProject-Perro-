package com.petshop.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.purchase.dto.CategoryVO;

@Repository
public class PurchaseDAO  {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<CategoryVO> CategoryList(){
		return mybatis.selectList("PurchaseMapper.categoryList");
	}


	public CategoryVO catDetail(String cno) {
		return mybatis.selectOne("PurchaseMapper.catDetail", cno);
	}


	public void catInsert(CategoryVO vo) {
		mybatis.insert("PurchaseMapper.catInsert", vo);
	}

	public int catUpdate(CategoryVO vo) {
		return mybatis.insert("PurchaseMapper.catUpdate", vo);
	}

	public int catDelete(CategoryVO vo) {
		return mybatis.delete("PurchaseMapper.catDelete", vo);
	}
}
