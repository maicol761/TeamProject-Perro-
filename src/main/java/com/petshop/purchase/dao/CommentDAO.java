package com.petshop.purchase.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petshop.purchase.dto.CommentVO;

import utils.Criteria;

@Repository
public class CommentDAO  {

	@Autowired
	private SqlSessionTemplate mybatis;
	

	public int saveComment(CommentVO vo) {
		return mybatis.insert("CommentMapper.saveComment",vo);
	}
	
	public int countCommentList(int pno) {
		return mybatis.selectOne("CommentMapper.countCommentList", pno);
	}

	public List<CommentVO> commentListWithPaging(Criteria criteria, int pno) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("criteria", criteria);
		map.put("pno", pno);
		return mybatis.selectList("CommentMapper.commentListWithPaging", map);
	}
	
	
	public int getCountR(int pno) {
		return mybatis.selectOne("CommentMapper.getCountR", pno);
	}
	
	public String getStarAvg(int pno) {
		return mybatis.selectOne("CommentMapper.getStarAvg", pno);
	}
	
	
	
}
