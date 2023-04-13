package com.petshop.controller.purchase;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petshop.admin.dto.MemberVO;
import com.petshop.purchase.dto.CartViewVO;
import com.petshop.purchase.dto.ConfirmVO;
import com.petshop.purchase.dto.OrderResultViewVO;
import com.petshop.purchase.dto.OrderVO;
import com.petshop.purchase.service.CartService;
import com.petshop.purchase.service.ConfirmService;
import com.petshop.purchase.service.OrderService;

import utils.Criteria;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;
	@Autowired
	private ConfirmService confirmService;
	
	@PostMapping("order_insert")
	public String orderInsert(Model model, HttpSession session) {

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) { // 로그인이 안된 경우
			return "main/login";
		} else {

			String mid = loginUser.getMid();
		
			List<CartViewVO> cartviewVo = cartService.getListcart(mid);
			
			// 장바구니 총액 계산
			int totalAmount = 0;

				for (CartViewVO vo1 : cartviewVo) {
					totalAmount += vo1.getQty() * vo1.getPrice();
					System.out.println("총"+totalAmount);
				}
			
			// "cartList" 속성에 조회한 데이터를 저장
			model.addAttribute("cartviewVo", cartviewVo);
			model.addAttribute("totalPrice", totalAmount);
			return "order/order";
		}
	}

	
	
		@PostMapping("order_real_insert")
		public String order_real_insert(Model model,OrderResultViewVO vvo,Criteria criteria,ConfirmVO cvo,
				HttpSession session,
			@RequestParam(value="cart")int[] cart,
			@RequestParam(value="pno")int[] pno,
			@RequestParam(value="qty")int[] qty,
			@RequestParam(value="address")String address,
			@RequestParam(value="phone")String phone,
			@RequestParam(value="copay")int copay,
			@RequestParam(value="coname")String coname
			) {
			
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			
			System.out.println(cart.length);
			
			for(int i=0;i<cart.length;i++){
		    System.out.println(pno[i]);
			
			System.out.println(qty[i]);
			}
			
			cvo.setMid(loginUser.getMid());
			cvo.setCopay(copay);
			cvo.setConame(coname);
			confirmService.insertConfirm(cvo);
			
			int cono=confirmService.getLastConfirm(loginUser.getMid());
			System.out.println(cono);
			
			
			System.out.println(address.toString());
			System.out.println(phone.toString());
			System.out.println(loginUser.getMid());
			
			for(int i=0;i<cart.length;i++) {
	
				orderService.insertOrder(loginUser.getMid(),pno[i],qty[i],cono,address,phone);
				cartService.deleteCart(cart[i]);
			}
			
			
			vvo.setMid(loginUser.getMid());
			
			criteria.setCount(cart.length);

			List<OrderResultViewVO> orderList =
					orderService.getOrderResultlist(criteria,vvo.getMid());
			
			int totalamount = 0;
			int dddd;
			
			for(OrderResultViewVO cc:orderList) {
				
				dddd = cc.getPrice()*cc.getQty();
				totalamount+=dddd;
				//totalamount = totalamout + totalamount
			}
			
			model.addAttribute("cono", cono);
			model.addAttribute("totalPrice", totalamount);
			model.addAttribute("orderList",orderList);
			
			return "order/orderperfect";
		}
		

}

