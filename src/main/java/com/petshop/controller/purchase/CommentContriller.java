package com.petshop.controller.purchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.petshop.admin.dto.MemberVO;
import com.petshop.purchase.dto.CommentVO;
import com.petshop.purchase.service.CommentService;


import utils.Criteria;
import utils.PageMaker;

@RestController
@RequestMapping("/comment")
public class CommentContriller {
 @Autowired
 private CommentService commentService;
 
	@GetMapping(value = "/list", produces = "application/json; charset=UTF-8")
	public Map<String, Object> commentList(CommentVO vo, Criteria criteria,
			@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
            @RequestParam(value = "rowsPerPage", defaultValue = "6") String rowsPerPage) {
       if(pageNum.length()==0) {
          pageNum="1";
      }
      int p = Integer.parseInt(pageNum);
      criteria.setPageNum(p);
      p=(p-1)*6; 
      criteria.setSqlPage(p); 
      criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
      System.out.println("vo="+vo.getPno());
      System.out.println("star="+vo.getStar());
	  Map<String, Object> commentInfo = new HashMap<>();
		List<CommentVO> commentList =commentService.getCommentListWithPaging(criteria,vo.getPno());
		//페이지 정보 작성
	//	PageMaker pageMaker =new PageMaker();
	//	pageMaker.setCriteria(criteria);
		String astar=commentService.getStarAvg(vo.getPno());
		double avgstar=0;
 		
 		if(astar!=null) {
 			avgstar=Double.parseDouble(astar);
 		}
				
	//	pageMaker.setTotalCount(commentService.getCountCommentList(o.gevtPno()));
		
		//commentInfo.put("total", commentList.size());
		commentInfo.put("avgstar", avgstar);
		commentInfo.put("commentList", commentList);
	//	commentInfo.put("pageInfo", pageMaker);
		return commentInfo;
	}
	
	  @PostMapping(value="/save")
	   public String saveCommentAction(CommentVO commentVO ,HttpSession session) {
	      MemberVO loginUser =(MemberVO) session.getAttribute("loginUser");
	      if(loginUser == null) {
	         return "not_logedin";
	      }else {
	         
	       commentVO.setWriter(loginUser.getMid()); //사용자  id저장
	         //상품평 저장
	         if(commentService.saveComment(commentVO)>0) {
	            return "success";
	         }else {
	            return "fail";
	         }
	      }
	}
}
