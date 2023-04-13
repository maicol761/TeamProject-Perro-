package com.petshop.beauty.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DogVO {
	private int dno;
	private String dogweight;
	private String breed;
	private int dpay;
	
	@Override
	public String toString() {
		return "몸무게:" + dogweight + " 견종:" + breed + " 가격:" + dpay + "원";
	}

}