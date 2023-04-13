package com.petshop.controller.purchase;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ListController {
		@RequestMapping("productAll")
	public String AllList() {
		return "product/ProductAll";
	}
}
