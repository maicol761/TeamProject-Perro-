
package com.petshop.controller.purchase;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petshop.admin.dto.MemberVO;
import com.petshop.purchase.dto.CartVO;
import com.petshop.purchase.dto.CartViewVO;
import com.petshop.purchase.dto.ProductVO;
import com.petshop.purchase.service.CartService;
import com.petshop.purchase.service.ProductService;

@Controller
public class CartController {
	@Autowired
	private CartService cService;
	@Autowired
	private ProductService pService;

//	@RequestMapping("cartlist")
//	public String cartList(MemberVO vo, ProductVO pvo, Model model, HttpSession session) {
//		// 세션에 사용자 정보가 저장되어 있는 확인(로그인 여부)
//		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
//
//		if (loginUser == null) { // 로그인이 안된 경우
//			return "main/login";
//		} else {

//			String mid = loginUser.getMid();
//
//			List<CartVO> cartVo = cService.listcart(mid);

//			for (CartVO vo1 : cartVo) {
//				ProductVO productVo = pService.price(vo1.getPno());
//				model.addAttribute("price", productVo);
//			}

//			model.addAttribute("cartList", cartVo);
//			return "cart/cartList";
//		}
//	}
	@RequestMapping("/cartlist")
	public String listCart(MemberVO vo, HttpSession session, Model model,ProductVO pvo) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) { // 로그인이 안된 경우
			return "main/login";
		} else {

			String mid = loginUser.getMid();
		
			List<CartViewVO> cartviewVo = cService.getListcart(mid);
			
			// 장바구니 총액 계산
			int totalAmount = 0;

				for (CartViewVO vo1 : cartviewVo) {
					totalAmount += vo1.getQty() * vo1.getPrice();
					System.out.println("총"+totalAmount);
				}
			
			// "cartList" 속성에 조회한 데이터를 저장
			model.addAttribute("cartList", cartviewVo);
			model.addAttribute("totalPrice", totalAmount);
		
			return "cart/cartList";
		}

	}

	
	
//	@PostMapping("/cart_insert")
//	public String insertCart(CartVO vo, HttpSession session) {
//		// 세션에 사용자 정보가 저장되어 있는 확인(로그인 여부)
//		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
//
//		if (loginUser == null) { // 로그인이 안된 경우
//			return "member/login";
//		} else {
//
//			vo.setMid(loginUser.getMid());
//			cService.insertCart(vo);
//
//			return "redirect:cart_list";
//		}
//	}
	
	

	@GetMapping("/cart_delete")
	public String cartDelete(@RequestParam(value = "cart")int cart) {

			cService.deleteCart(cart);

		return "redirect:cartlist";
	}
	
//--------------------------------------------------------------------------
	
	@GetMapping("cartChange")
	public String cartChangeHome(Model model,CartViewVO vo,
	@RequestParam(value="cart")int cart,
	@RequestParam(value="qty")int qty,
	@RequestParam(value="pname")String pname,
	@RequestParam(value="wprice")int wprice
			
			) {
		System.out.println(cart+"qty="+vo.getQty());
		vo.setCart(cart);
		vo.setQty(qty);
		vo.setPname(pname);
		vo.setWprice(wprice);
		
		
			model.addAttribute("vo", vo);
		
		return "cart/cartChange";
	}
	
	@PostMapping("cart_update")
	public String cartupdate(CartVO vo) {
		
		cService.updateCart(vo);
		System.out.println("qty="+vo.getQty() +"cart="+ vo.getCart());
		
		return "cart/cartChangeResult";
	}

}
