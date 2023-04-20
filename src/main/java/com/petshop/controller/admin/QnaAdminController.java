package com.petshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petshop.admin.service.QnaAdminService;
import com.petshop.beauty.dto.AVO;
import com.petshop.beauty.dto.QVO;
import com.petshop.beauty.service.QnaService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class QnaAdminController {
	
	@Autowired 
	private QnaAdminService qnaAdminService;
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("admin_qna")
	public String adminQna(Model model,Criteria criteria,QVO vo,
			@RequestParam(value = "acheck", defaultValue = "") String acheck,
			@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
	        @RequestParam(value = "rowsPerPage", defaultValue = "5") String rowsPerPage) {
		   if(pageNum.length()==0) {
			   pageNum="1";
		  }
		  int p = Integer.parseInt(pageNum);
		  criteria.setPageNum(p);
		  p=(p-1)*5; 
		  criteria.setSqlPage(p); 
		  criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
	     // (1) 전체 상품목록 조회
		 List<QVO> qnaAllList=qnaAdminService.getQnaAllList(criteria,acheck);
		 
	     // (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
	     PageMaker pageMaker = new PageMaker();
	     pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
	     pageMaker.setTotalCount(qnaAdminService.getQnaCount(acheck)); // 전체 게시글의 수 저장
	     
	     model.addAttribute("qnaAllList", qnaAllList);
	     model.addAttribute("pageMaker", pageMaker);
		
		return "admin/qna/adminqna";
	}
	
	@PostMapping("a_insert")
	public String aInsert(
			@RequestParam(value = "qno") int qno,
			@RequestParam(value = "mid") String mid,
			AVO avo) {
		
		avo.setQno(qno);
		avo.setMid(mid);
		qnaAdminService.insertA(avo);
		qnaAdminService.aUpdate(qno);
		
		return "redirect:admin_qna";
	}
	
	@GetMapping("admin_qna_view")
	public String qnaView(
			@RequestParam(value = "qno") int qno,
			QVO vo,AVO avo,Model model) {
		vo.setQno(qno);
		QVO qvo=qnaService.getQView(vo);
		
		int a=qnaService.getACheck(qno);

		if(a!=0) {
			avo=qnaService.getAView(qno);
			model.addAttribute("avo", avo);		
		}
		
		model.addAttribute("a", a);
		model.addAttribute("qvo", qvo);
		
		return "admin/qna/adminQnaView";
	}
	
	

}
