package com.petshop.purchase.service;

import java.util.List;

import com.petshop.purchase.dto.CommentVO;

import utils.Criteria;

public interface CommentService {

	 int saveComment(CommentVO vo);
	
	 int getCountCommentList(int pno);
	 
	 List<CommentVO> getCommentListWithPaging(Criteria criteria, int pno);
	 int getCountR(int pno);
	 String getStarAvg(int pno);
}