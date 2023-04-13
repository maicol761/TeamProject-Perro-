package com.petshop.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petshop.purchase.dao.CommentDAO;
import com.petshop.purchase.dto.CommentVO;


import utils.Criteria;

@Service("commentService")
public class CommentServiceIml implements CommentService {

	@Autowired
	private CommentDAO commentDao;
	@Override
	public int saveComment(CommentVO vo) {
		return commentDao.saveComment(vo);
	}
	@Override
	public int getCountCommentList(int pno) {
		
		return commentDao.countCommentList(pno);
	}
	

	@Override
	public List<CommentVO> getCommentListWithPaging(Criteria criteria, int pno) {
		
		return commentDao.commentListWithPaging(criteria, pno);
	}
	@Override
	public int getCountR(int pno) {
		return commentDao.getCountR(pno);
	}
	@Override
	public String getStarAvg(int pno) {
		return commentDao.getStarAvg(pno);
	}
}
