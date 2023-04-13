package com.petshop.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petshop.admin.dto.MemberVO;
import com.petshop.admin.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
//--------------------------------------------------------------------------------------	
	@RequestMapping("basicUpdate")
	public String basicUpdate(MemberVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		// System.out.println("로그인?"+loginUser.toString());
		if (loginUser == null) { // 로그인이 안된 경우
			return "main/login";
		} else {
			System.out.println(vo.toString());
			
			memberService.memberUpdate(vo);
			
			return "redirect:reservationListAll";
		}
	}

}
