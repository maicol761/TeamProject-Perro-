package com.petshop.controller.beauty;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petshop.admin.dto.MemberVO;
import com.petshop.beauty.dto.AVO;
import com.petshop.beauty.dto.FaqVO;
import com.petshop.beauty.dto.QVO;
import com.petshop.beauty.service.QnaService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("faq_Home")
	public String faqHome(Model model) {
		  
	     // (1) 전체 상품목록 조회
		 List<FaqVO> faqList=qnaService.getFaqList("");
		 List<FaqVO> faqList2=qnaService.getFaqList("배송");
		 List<FaqVO> faqList3=qnaService.getFaqList("주문/결제");
		 List<FaqVO> faqList4=qnaService.getFaqList("교환/반품");
		 List<FaqVO> faqList5=qnaService.getFaqList("회원정보");
		 List<FaqVO> faqList6=qnaService.getFaqList("미용문의");

	     // (2) model 객체에 상품 목록 저장
	     model.addAttribute("faqList", faqList);
	     model.addAttribute("faqList2", faqList2);
	     model.addAttribute("faqList3", faqList3);
	     model.addAttribute("faqList4", faqList4);
	     model.addAttribute("faqList5", faqList5);
	     model.addAttribute("faqList6", faqList6);
	     
     return "beauty/faqHome";
	}
	
	
	
	
	@GetMapping("qna_insert_home")
	public String qnaInsertHome(){
		return "beauty/qnaInsert";
	}
	
	@PostMapping("qna_insert")
	public String qnaInsert(QVO vo) {
		qnaService.insertQ(vo);
		return "redirect:qna_Home";
	}
	
	@GetMapping("qna_All_List")
	public String qnaHome(Model model,Criteria criteria,QVO vo,
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
		 List<QVO> qnaAllList=qnaService.getQnaAllList(criteria,acheck);
		 
	     // (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
	     PageMaker pageMaker = new PageMaker();
	     pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
	     pageMaker.setTotalCount(qnaService.getQnaCount(acheck)); // 전체 게시글의 수 저장
	     
	     model.addAttribute("qnaAllList", qnaAllList);
	     model.addAttribute("pageMaker", pageMaker);
		
		return "admin/qaOffer";
	}
	
	@GetMapping("qna_Home")
	public String qnaHome(Model model,Criteria criteria,QVO vo,HttpSession session,
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
		 int a=qnaService.getACheck(vo.getQno());
		 MemberVO vo2= (MemberVO) session.getAttribute("loginUser");
		 List<QVO> qnaList=qnaService.getQnaList(criteria,vo2.getMid());
		 
	     // (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
	     PageMaker pageMaker = new PageMaker();
	     pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
	     pageMaker.setTotalCount(qnaService.getQnaCountMid(vo2.getMid())); // 전체 게시글의 수 저장
	     
	     model.addAttribute("a", a);
	     model.addAttribute("qnaList", qnaList);
	     model.addAttribute("pageMaker", pageMaker);
		
		return "beauty/qnaHome";
	}
	
	@GetMapping("qna_view")
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
		
		return "beauty/qnaView";
	}
	
	@GetMapping("qna_view_insert")
	public String qnaViewInsert(
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
		
		return "admin/qaOfferInsert";
	}
	
	@PostMapping("a_insert")
	public String aInsert(
			@RequestParam(value = "qno") int qno,
			AVO avo) {
		
		avo.setQno(qno);
		qnaService.insertA(avo);
		qnaService.aUpdate(qno);
		
		return "redirect:qna_All_List";
	}
	
	

}