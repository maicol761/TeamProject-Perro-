package com.petshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petshop.admin.dto.MemberVO;
import com.petshop.admin.service.BeautyService;
import com.petshop.beauty.dao.ReservationDAO;
import com.petshop.beauty.dto.DogVO;
import com.petshop.beauty.dto.ReservationVO;
import com.petshop.beauty.dto.ServiceVO;
import com.petshop.beauty.service.ReservationService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class BeautyController {

	@Autowired
	private BeautyService bService;
	@Autowired
	private ReservationService rService;
	@GetMapping("reservationOffer")
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
		List<ReservationVO> rList = bService.rList(criteria);

		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
		pageMaker.setTotalCount(bService.rCount()); // 전체 게시글의 수 저장

		// (2) model 객체에 상품 목록 저장
		model.addAttribute("rList", rList);
		model.addAttribute("urlname", "reservationOffer");
		model.addAttribute("pageMaker", pageMaker);

		return "admin/reservationOffer";
	}

//	
//	@RequestMapping("reservationOfferModify")
//	public String reservationOfferModify(Model model) {
//		List<ReservationVO> rList = bService.rList(criteria);
//		model.addAttribute("rList", rList);
//		return "admin/reservationOfferModify";
//	}



	@RequestMapping("dogOffer")
	public String dogOffer(Model model, Criteria criteria,
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
		List<DogVO> dogList = bService.dogList(criteria);
		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
		pageMaker.setTotalCount(bService.dCount()); // 전체 게시글의 수 저장

		// (2) model 객체에 상품 목록 저장
		model.addAttribute("dogList", dogList);
		model.addAttribute("urlname", "dogOffer");
		model.addAttribute("pageMaker", pageMaker);

		return "admin/dogOffer";
	}
	
	@RequestMapping("dogModify")
	public String dogModify(Model model) {
		List<DogVO> dogList = rService.getDog();
		model.addAttribute("dogList", dogList);
		return "admin/dogOfferModify";
	}

	@RequestMapping("dogModifyOk")
	public String getAdminModify(@RequestParam("dno")String dno, DogVO vo, Model model) {
		//bService.dogUpdate(vo);
		DogVO dogDetail = bService.dogDetail(vo.getDno());
		model.addAttribute("dogDetail", dogDetail);
		return "admin/dogOfferModifyOk";
	}


	@GetMapping("dogInsert")
	public String dogInsert() {
		return "admin/dogInsert";
	}

	@PostMapping("dogInsertOk")
	public String dogInsertOk(DogVO vo, Model model) {
		bService.dogInsert(vo);
		List<DogVO> dogList = rService.getDog();
		model.addAttribute("dogList", dogList);
		return "admin/dogOffer";

	}
	@PostMapping("dogUpdate")
	@ResponseBody
	public String dogUpdate(DogVO vo, Model model) {
		System.out.println("옵데이트"+vo);
		int result = 0;
		result = bService.dogUpdate(vo);
		if (result == 1)
			return "success";
		else
			return "fail";

	}
	@RequestMapping(value = "dogDelete", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String memberDelete(DogVO vo, Model model) {
		System.out.println(vo);
		int result = 0;
		result = bService.dogDelete(vo);
		if (result == 1)
			return "success";
		else
			return "fail";
	}
	
	
	@RequestMapping("serviceOffer")
	public String serviceOffer(Model model) {
		List<ServiceVO> sList = rService.getServiceList();
		System.out.println(sList);
		model.addAttribute("sList", sList);
		return "admin/serviceOffer";
	}
	@RequestMapping("serviceModifyOk")
	public String getAdminModify(@RequestParam("sno")String sno, ServiceVO vo, Model model) {
		//bService.dogUpdate(vo);
		ServiceVO sDetail = bService.serviceDetail(sno);
		model.addAttribute("sDetail", sDetail);
		return "admin/serviceOfferModifyOk";
	}
	@RequestMapping("serviceModify")
	public String serviceModify(Model model) {
		List<ServiceVO> sList = rService.getServiceList();
		System.out.println(sList);
		model.addAttribute("sList", sList);
		return "admin/serviceOfferModify";
	}
	@PostMapping("serviceUpdate")
	@ResponseBody
	public String serviceUpdate(ServiceVO vo, Model model) {
		System.out.println("옵데이트"+vo);
		int result = 0;
		result = bService.serviceUpdate(vo);
		if (result == 1)
			return "success";
		else
			return "fail";

	}
	@RequestMapping(value = "serviceDelete", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String serviceDelete(ServiceVO vo, Model model) {
		System.out.println(vo);
		int result = 0;
		result = bService.serviceDelete(vo);
		if (result == 1)
			return "success";
		else
			return "fail";
	}
	
	@GetMapping("serviceInsert")
	public String serviceInsert() {
		return "admin/serviceInsert";
	}
	@PostMapping("serviceInsertOk")
	public String serviceInsertOk(ServiceVO vo, Model model) {
		bService.serviceInsert(vo);
		List<ServiceVO> sList = rService.getServiceList();
		model.addAttribute("sList", sList);
		return "admin/serviceOffer";

	}
}
