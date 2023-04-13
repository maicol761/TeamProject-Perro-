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

import com.petshop.admin.service.PurchaseService;
import com.petshop.beauty.dto.ReservationVO;
import com.petshop.beauty.dto.ServiceVO;
import com.petshop.purchase.dto.CategoryVO;

@Controller
public class PurchaseController {

	@Autowired
	private PurchaseService pService;
	
	@GetMapping("categoryOffer")
	public String categoryOffer(Model model){
		List<CategoryVO> catList = pService.CategoryList();
		model.addAttribute("catList", catList);
		return "admin/categoryOffer";
	}
	@RequestMapping("categoryOfferModify")
	public String reservationOfferModify(Model model) {
		List<CategoryVO> catList = pService.CategoryList();
		model.addAttribute("catList", catList);
		return "admin/categoryOfferModify";
	}
	@RequestMapping("categoryModifyOk")
	public String getAdminModify(@RequestParam("cno")String cno, CategoryVO vo, Model model) {
		//bService.dogUpdate(vo);
		CategoryVO catDetail = pService.catDetail(cno);
		model.addAttribute("catDetail", catDetail);
		return "admin/categoryOfferModifyOk";
	}
	@RequestMapping("categoryModify")
	public String serviceModify(Model model) {
		List<CategoryVO> catList = pService.CategoryList();
		System.out.println(catList);
		model.addAttribute("catList", catList);
		return "admin/categoryOfferModify";
	}
	@RequestMapping("categoryUpdate")
	@ResponseBody
	public String serviceUpdate(CategoryVO vo, Model model) {
		System.out.println("옵데이트"+vo);
		int result = 0;
		result = pService.catUpdate(vo);
		if (result == 1)
			return "success";
		else
			return "fail";

	}
	@RequestMapping(value = "categoryDelete", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String serviceDelete(CategoryVO vo, Model model) {
		System.out.println(vo);
		int result = 0;
		result = pService.catDelete(vo);
		if (result == 1)
			return "success";
		else
			return "fail";
	}
	
	@GetMapping("categoryInsert")
	public String serviceInsert() {
		return "admin/categoryInsert";
	}
	@PostMapping("categoryInsertOk")
	public String serviceInsertOk(CategoryVO vo, Model model) {
		pService.catInsert(vo);
		List<CategoryVO> catList = pService.CategoryList();
		model.addAttribute("catList", catList);
		return "admin/categoryOffer";

	}
}
