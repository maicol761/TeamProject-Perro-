package com.petshop.controller.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.petshop.purchase.dto.ConfirmVO;
import com.petshop.purchase.dto.SalesQuantity;
import com.petshop.purchase.service.ConfirmService;

import utils.Criteria;
import utils.PageMaker;

@Controller
@SessionAttributes("admin")
public class ConfirmController {
	
	@Autowired
	private ConfirmService confirmService;
	
	@GetMapping("confirm_Home")
	public String confirmHome(Model model,Criteria criteria,
            @RequestParam(value = "mid", defaultValue = "") String mid,
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
      List<ConfirmVO> confirmAllList=confirmService.getConfirmAllList(criteria, mid);

       // (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
       PageMaker pageMaker = new PageMaker();
       pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
       pageMaker.setTotalCount(confirmService.getConfirmAllCount(mid)); // 전체 게시글의 수 저장
       pageMaker.setUrl("confirm_Home");
       
       // (2) model 객체에 상품 목록 저장
       model.addAttribute("confirmAllList", confirmAllList);
       model.addAttribute("pageMaker", pageMaker);
        return "admin/orderOffer";
	}
	
	
	   //상품별 판매 실적 화면 출력
	   @RequestMapping("admin_sales_record_form")
	   public String adminProductSalesRecordForm() {
		  return "admin/orderOfferRecords"; 
	   }
	   
	   @RequestMapping("sales_record_chart")
	   @ResponseBody // 화면이 아닌 데이터를 리턴하는 메소드로 지정
	   public List<SalesQuantity> salesRecordChart(){
		   List<SalesQuantity> listSales = confirmService.getProductSales();
		   for(int i=0;i<listSales.size();i++) {
			   listSales.get(i).setDate(listSales.get(i).getDate()+"월");
		   }
		   
		   return listSales;
	   }
	   
	}
	
