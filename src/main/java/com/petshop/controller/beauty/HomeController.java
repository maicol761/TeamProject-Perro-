package com.petshop.controller.beauty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.petshop.admin.dto.MemberVO;
import com.petshop.admin.service.MemberService;

@Controller
@SessionAttributes("loginUser")
public class HomeController {
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home() {
		return "main/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "main/login";
	}

	@PostMapping(value = "/joinOk")
	public String joinOk(@RequestParam(value = "mid2", defaultValue = "") String mid,
			MemberVO vo, Model model) {
		vo.setMid(mid);
		System.out.println(vo.toString());
		int result = memberService.join(vo);
		
		// System.out.println(result);
		if (result == 1) {
			model.addAttribute("joinResult", "회원가입완료");
			return "main/login";
		} else if (result == 0) {
			model.addAttribute("joinResult", "회원가입실패");
		}
		return "redirect:main/join";
	}

	@RequestMapping(value = "/about")
	public String about() {
		return "main/about";
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "main/join";
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinGo() {
		return "main/join";
	}
	
	@RequestMapping(value="/idCheck")
	@ResponseBody
	public String idCheckView(@RequestParam(value = "mid2", defaultValue = "") String mid,
			MemberVO vo, Model model) {
		int result = 0;
		result = memberService.idCheck(mid);
		System.out.println("아이디"+mid);
		System.out.println("result"+result);
		if(result == 0) {
			return "success";
		}
		else {
			return "fail";
		}
		
	}
	
	//로그인
	@RequestMapping("/loginOk")
	public String loginAction(MemberVO vo, Model model) {
		MemberVO vo2 = memberService.getMemberLogin(vo);
		int result=0;
		
		if(vo2!=null) {
			result=1;
		}
		
		if(result ==1) {
			MemberVO user =  memberService.memberdetail(vo);
			model.addAttribute("loginUser", user);
			return "redirect:index";
		}else {
			return "main/login";
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "main/index";
	}
	@RequestMapping("forgotpwd")
	public String forgotpwd() {
		return "main/forgot-pwd";
	}
	@RequestMapping("directions")
	public String directions() {
		return "main/directions";
	}
//about choi--------------------------------------------------------------------------------------------	
	@GetMapping("about_choi")
	public String aboutchoi() {
		return "about/choi";
	}
	@GetMapping("choiCode1")
	public String choiCode1() {
		return "about/choiCode/choicode1";
	}
//about lee--------------------------------------------------------------------------------------------	
	@GetMapping("about_lee")
	public String aboutlee() {
		return "about/lee";
	}
	@GetMapping("leeCode1")
	public String leeCode1() {
		return "about/leeCode/leecode1";
	}
}
