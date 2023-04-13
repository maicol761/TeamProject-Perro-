package com.petshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petshop.admin.dto.MemberVO;
import com.petshop.admin.service.AdminService;
import com.petshop.admin.service.MemberService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class AdminController {
	@Autowired
	AdminService aService;
	@Autowired
	MemberService mService;

	@RequestMapping("adminOffer")
	public String adminOffer(Model model, Criteria criteria,
			@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
			@RequestParam(value = "rowsPerPage", defaultValue = "8") String rowsPerPage) {

		if (pageNum.length() == 0) {
			pageNum = "1";
		}
		int p = Integer.parseInt(pageNum);
		criteria.setPageNum(p);
		p = (p - 1) * 8;
		criteria.setSqlPage(p);
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
		// (1) 전체 상품목록 조회
		List<MemberVO> adminList = aService.adminList(criteria);

		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
		pageMaker.setTotalCount(aService.adminCount()); // 전체 게시글의 수 저장

		// (2) model 객체에 상품 목록 저장
		model.addAttribute("adminList", adminList);
		model.addAttribute("urlname", "adminOffer");
		model.addAttribute("pageMaker", pageMaker);

		return "admin/adminOffer";
	}

	@RequestMapping("memberOffer")
	public String memberOffer(Model model, Criteria criteria,
			@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
			@RequestParam(value = "rowsPerPage", defaultValue = "8") String rowsPerPage) {
		if (pageNum.length() == 0) {
			pageNum = "1";
		}
		int p = Integer.parseInt(pageNum);
		criteria.setPageNum(p);
		p = (p - 1) * 8;
		criteria.setSqlPage(p);
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
		// (1) 전체 상품목록 조회
		List<MemberVO> memberList = mService.memberList(criteria);

		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
		pageMaker.setTotalCount(mService.memberCount(criteria)); // 전체 게시글의 수 저장

		// (2) model 객체에 상품 목록 저장
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("urlname", "memberOffer");

		return "admin/memberOffer";
	}

	@GetMapping("qaOffer")
	public String qaOffer() {
		return "admin/qaOffer";
	}

	@GetMapping("productOffer")
	public String productOffer() {
		return "admin/productOffer";
	}

	@GetMapping("orderOffer")
	public String orderOffer() {
		return "admin/orderOffer";
	}

	@RequestMapping("adminModify")
	public String adminModify(Model model, Criteria criteria,
			@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
			@RequestParam(value = "rowsPerPage", defaultValue = "8") String rowsPerPage) {
		if (pageNum.length() == 0) {
			pageNum = "1";
		}
		int p = Integer.parseInt(pageNum);
		criteria.setPageNum(p);
		p = (p - 1) * 8;
		criteria.setSqlPage(p);
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
		// (1) 전체 상품목록 조회
		List<MemberVO> adminList = aService.adminList(criteria);

		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
		pageMaker.setTotalCount(aService.adminCount()); // 전체 게시글의 수 저장

		// (2) model 객체에 상품 목록 저장
		model.addAttribute("adminList", adminList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("urlname", "adminModify");

		return "admin/adminOfferModify";
	}

//	@GetMapping("adminModify")
//	public String getAdminModify(Model model) {
//		List<MemberVO> adminList = aService.adminList(criteria);
//		model.addAttribute("adminList", adminList);
//		return "admin/adminOfferModify";
//	}


	@GetMapping("memberModify")
	public String getMemberModify(Model model, Criteria criteria,
			@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
			@RequestParam(value = "rowsPerPage", defaultValue = "8") String rowsPerPage) {
		if (pageNum.length() == 0) {
			pageNum = "1";
		}
		int p = Integer.parseInt(pageNum);
		criteria.setPageNum(p);
		p = (p - 1) * 8;
		criteria.setSqlPage(p);
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
		// (1) 전체 상품목록 조회
		List<MemberVO> memberList = mService.memberList(criteria);

		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
		pageMaker.setTotalCount(mService.memberCount(criteria)); // 전체 게시글의 수 저장

		// (2) model 객체에 상품 목록 저장
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("urlname", "memberModify");

		model.addAttribute("memberList", memberList);
	
		return "admin/memberOfferModify";
	}


	@RequestMapping("adminModifyOk")
	public String getAdminModify(@RequestParam("mid") String mid, Model model) {
		MemberVO adminDetail = aService.adminDetail(mid);
		model.addAttribute("mid", mid);
		model.addAttribute("adminDetail", adminDetail);
		return "admin/adminOfferModifyOk";
	}

	@RequestMapping("memberModifyOk")
	public String getMemberModify(@RequestParam("mid") String mid, Model model) {
		MemberVO memberDetail = mService.memberdetail2(mid);
		System.out.println(memberDetail);
		model.addAttribute("mid", mid);
		model.addAttribute("MemberDetail", memberDetail);
		return "admin/memberOfferModifyOk";
	}

	@RequestMapping(value = "adminUpdate", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String adminUpdate(MemberVO vo, Model model) {
		int result = 0;
		result = aService.adminUpdate(vo);
		if (result == 1)
			return "success";
		else
			return "fail";
	}

	@RequestMapping(value = "memberDelete", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String memberDelete(MemberVO vo, Model model) {
		System.out.println(vo);
		int result = 0;
		result = mService.memberDelete(vo);
		if (result == 1)
			return "success";
		else
			return "fail";
	}

	@RequestMapping(value = "memberUpdate", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String memberUpdate(MemberVO vo, Model model) {
		int result = 0;
		result = mService.memberUpdate(vo);
		if (result == 1)
			return "success";
		else
			return "fail";
	}

	@RequestMapping(value = "adminDelete", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String adminDelete1(MemberVO vo, Model model) {
		System.out.println(vo);
		int result = 0;
		result = aService.adminDelete(vo);
		if (result == 1)
			return "success";
		else
			return "fail";
	}
	
	
//------------------------------------------------------------------------	
	@GetMapping("admin_home")
	public String adminHome() {
		return "/admin/adminhome";
	}
	
	@GetMapping("chartView")
	public String chartView() {
		return "/admin/chart/chart";
	}
	
	
	
	
	
}
