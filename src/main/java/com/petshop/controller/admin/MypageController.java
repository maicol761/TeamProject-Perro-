package com.petshop.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petshop.admin.dto.MemberVO;
import com.petshop.admin.dto.ReservationListAllVO;
import com.petshop.admin.service.MemberService;
import com.petshop.admin.service.MypageService;
import com.petshop.purchase.dto.ConfirmVO;
import com.petshop.purchase.dto.OrderResultViewVO;
import com.petshop.purchase.service.ConfirmService;
import com.petshop.purchase.service.OrderService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;
	@Autowired
	private MemberService meService;
	@Autowired
	private ConfirmService confirmService;
	@Autowired
	private OrderService orderService;

	@RequestMapping("reservationListAll")
	public String reservationListAll(Model model, Criteria criteria, HttpSession session,
			@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
			@RequestParam(value = "rowsPerPage", defaultValue = "5") String rowsPerPage) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		// System.out.println("로그인?"+loginUser.toString());
		if (loginUser == null) { // 로그인이 안된 경우
			return "main/login";
		} else {
			String mid = loginUser.getMid();
			System.out.println("2올");
			System.out.println("mid"+mid);
			System.out.println("페이지넘"+pageNum);
			System.out.println("로우퍼페이지"+rowsPerPage);
			if (pageNum.length() == 0) {
				pageNum = "1";
				System.out.println("3올");

			}
			int p = Integer.parseInt(pageNum);
			criteria.setPageNum(p);
			p = (p - 1) * 5;
			criteria.setSqlPage(p);
			System.out.println("p?"+p);

			criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
			// (1) 전체 상품목록 조회
			
			List<ReservationListAllVO> rListAll = mypageService.getreservationListAll(mid, criteria);
			
			System.out.println(">>>>>>>>>>>>> 예약 목록");
			for(ReservationListAllVO vo : rListAll) {
				System.out.print(vo);
			}
			// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
			pageMaker.setTotalCount(mypageService.getrAllcount(mid)); // 전체 게시글의 수 저장

			// (2) model 객체에 상품 목록 저장
			model.addAttribute("rListAll", rListAll);
			model.addAttribute("pageMaker", pageMaker);
			// System.out.println("리스트" + rListAll.get(0).toString());

			return "mypage/reservationListAll";
		}

	}

	@RequestMapping("NowreservationListAll")
	public String pastReservationListAll(Model model, Criteria criteria, HttpSession session,
			@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
			@RequestParam(value = "rowsPerPage", defaultValue = "5") String rowsPerPage) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		// System.out.println("로그인?"+loginUser.toString());
		if (loginUser == null) { // 로그인이 안된 경우
			return "main/login";
		} else {
			String mid = loginUser.getMid();
			System.out.println("2올");
			System.out.println("mid"+mid);
			System.out.println("페이지넘"+pageNum);
			System.out.println("로우퍼페이지"+rowsPerPage);
			if (pageNum.length() == 0) {
				pageNum = "1";
				System.out.println("3올");

			}
			int p = Integer.parseInt(pageNum);
			criteria.setPageNum(p);
			p = (p - 1) * 5;
			criteria.setSqlPage(p);
			System.out.println("p?"+p);

			criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
			// (1) 전체 상품목록 조회
			
			List<ReservationListAllVO> rListAll = mypageService.getNowReservationListAll(mid, criteria);
			
			System.out.println(">>>>>>>>>>>>> 예약 목록");
			for(ReservationListAllVO vo : rListAll) {
				System.out.print(vo);
			}
			// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
			pageMaker.setTotalCount(mypageService.getRNowcount(mid)); // 전체 게시글의 수 저장

			// (2) model 객체에 상품 목록 저장
			model.addAttribute("rListAll", rListAll);
			model.addAttribute("pageMaker", pageMaker);
			// System.out.println("리스트" + rListAll.get(0).toString());
			return "mypage/nowReservationListAll";
		}

	}
	
	@RequestMapping("PastreservationListAll")
	public String nowReservationListAll(Model model, Criteria criteria, HttpSession session,
			@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
			@RequestParam(value = "rowsPerPage", defaultValue = "5") String rowsPerPage) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		// System.out.println("로그인?"+loginUser.toString());
		if (loginUser == null) { // 로그인이 안된 경우
			return "main/login";
		} else {
			String mid = loginUser.getMid();
			System.out.println("2올");
			System.out.println("mid"+mid);
			System.out.println("페이지넘"+pageNum);
			System.out.println("로우퍼페이지"+rowsPerPage);
			if (pageNum.length() == 0) {
				pageNum = "1";
				System.out.println("3올");

			}
			int p = Integer.parseInt(pageNum);
			criteria.setPageNum(p);
			p = (p - 1) * 5;
			criteria.setSqlPage(p);
			System.out.println("p?"+p);

			criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
			// (1) 전체 상품목록 조회
			
			List<ReservationListAllVO> rListAll = mypageService.getPastReservationListAll(mid, criteria);
			
			System.out.println(">>>>>>>>>>>>> 예약 목록");
			for(ReservationListAllVO vo : rListAll) {
				System.out.print(vo);
			}
			// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
			pageMaker.setTotalCount(mypageService.getRPastcount(mid)); // 전체 게시글의 수 저장

			// (2) model 객체에 상품 목록 저장
			model.addAttribute("rListAll", rListAll);
			model.addAttribute("pageMaker", pageMaker);
			// System.out.println("리스트" + rListAll.get(0).toString());
			return "mypage/pastReservationListAll";
		}
	}
	
	@RequestMapping("reserDelete")
	public String reserDelete(@RequestParam("rno") int rno, Model model) {
		System.out.println("난삭제");
		int result = 0;
		result = mypageService.reserDelete(rno);
		System.out.println("삭제결과" + result);
		return "redirect:NowreservationListAll";

	}
	
	
	
	
//reserv---------------------------------------------------------------------------------------	

	



	@RequestMapping("basicImpo")
	public String getMemberModify(Model model, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		// System.out.println("로그인?"+loginUser.toString());
		if (loginUser == null) { // 로그인이 안된 경우
			return "main/login";
		} else {
			MemberVO memberDetail = meService.memberdetail2(loginUser.getMid());
			System.out.println(memberDetail);
			model.addAttribute("mid", loginUser.getMname());
			model.addAttribute("MemberDetail", memberDetail);
			return "mypage/basicImpomation";
		}
	}


	@RequestMapping("pwdChange")
	public String pwdChange(Model model, MemberVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		// System.out.println("로그인?"+loginUser.toString());
		if (loginUser == null) { // 로그인이 안된 경우
			return "main/login";
		} else {
			model.addAttribute("mid", loginUser.getMid());
			return "mypage/pwdChange";
		}
	}

	@RequestMapping("pwdUpdate")
	public String pwdUpdate(Model model, MemberVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		// System.out.println("로그인?"+loginUser.toString());
		if (loginUser == null) { // 로그인이 안된 경우
			return "main/login";
		} else {
			meService.pwdUpdate(vo);
			MemberVO memberDetail = meService.memberdetail2(loginUser.getMid());
			System.out.println("디테일" + vo.getMpwd());
			model.addAttribute("mid", loginUser.getMid());
			return "redirect:reservationListAll";

		}
	}
	
	
	
	   @GetMapping("confirm_now_list")
	   public String confirmNowList(Model model, Criteria criteria, HttpSession session,
				@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
				@RequestParam(value = "rowsPerPage", defaultValue = "5") String rowsPerPage) {
		   
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			
			if (loginUser == null) { // 로그인이 안된 경우
				return "main/login";
				
			} else {
				if (pageNum.length() == 0) {
					pageNum = "1";
				}
				int p = Integer.parseInt(pageNum);
				criteria.setPageNum(p);
				p = (p - 1) * 5;
				criteria.setSqlPage(p);

				criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
				// (1) 전체 상품목록 조회
				List<ConfirmVO> confirmNowList = confirmService.getConfirmNowList(criteria, loginUser.getMid());
				
				// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
				pageMaker.setTotalCount(confirmService.getConfirmNowCount(loginUser.getMid())); // 전체 게시글의 수 저장
				
				// (2) model 객체에 상품 목록 저장
				model.addAttribute("confirmNowList", confirmNowList);
				model.addAttribute("pageMaker", pageMaker);
				// System.out.println("리스트" + rListAll.get(0).toString());
				return "mypage/confirmNowList";
			}
	   }
	   
	   @GetMapping("confirm_past_list")
	   public String confirmPastList(Model model, Criteria criteria, HttpSession session,
				@RequestParam(value = "pageNum", defaultValue = "") String pageNum,
				@RequestParam(value = "rowsPerPage", defaultValue = "5") String rowsPerPage) {
		   
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if (loginUser == null) { // 로그인이 안된 경우
				return "main/login";
				
			} else {
				if (pageNum.length() == 0) {
					pageNum = "1";
				}
				int p = Integer.parseInt(pageNum);
				criteria.setPageNum(p);
				p = (p - 1) * 5;
				criteria.setSqlPage(p);

				criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
				// (1) 전체 상품목록 조회
				List<ConfirmVO> confirmPastList = confirmService.getConfirmPastList(criteria, loginUser.getMid());
				
				// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCriteria(criteria); // 현재 페이지 정보 저장
				pageMaker.setTotalCount(confirmService.getConfirmPastCount(loginUser.getMid())); // 전체 게시글의 수 저장
				
				// (2) model 객체에 상품 목록 저장
				model.addAttribute("confirmPastList", confirmPastList);
				model.addAttribute("pageMaker", pageMaker);
				// System.out.println("리스트" + rListAll.get(0).toString());
				return "mypage/confirmPastList";
			}
	   }
	   
	   
	   @GetMapping("confirm_view")
	   public String confirmView(Model model,HttpSession session,
			   @RequestParam(value = "cono") int cono) {
		   MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if (loginUser == null) { // 로그인이 안된 경우
				return "main/login";
			} else {
				 List<OrderResultViewVO> orderList=orderService.getOrderList(cono);
				 ConfirmVO cvo=confirmService.getConfirm(cono);
				 
				 int totalamount = 0;
					int dddd;
					
					for(OrderResultViewVO cc:orderList) {
						
						dddd = cc.getPrice()*cc.getQty();
						totalamount+=dddd;
						//totalamount = totalamout + totalamount
					}
				 String phone=orderList.get(0).getPhone();
				 String address=orderList.get(0).getAddress();
				
				 
				 model.addAttribute("address", address);
				 model.addAttribute("phone", phone);
				 model.addAttribute("cvo", cvo);
				 model.addAttribute("totalPrice", totalamount);
				 model.addAttribute("orderList", orderList);
				 return "mypage/confirmDetail";
			}
	   }
	   
	   @GetMapping("deleteConfirm")
	   public String deleteConfirm(ConfirmVO cvo) {
		   System.out.println(cvo.getCono());
		   orderService.deleteOrder(cvo.getCono());
		   confirmService.deleteConfirm(cvo.getCono());
		   
		   return "redirect:confirm_now_list";
	   }
	   
	  
	   
	   
	   
	   
	   
	
}
