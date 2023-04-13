package com.petshop.purchase.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderVO {
	private int onum;
	private String mid;
	private String odate;
	private int pno;
	private int qty;
	private int cono;
	private String address;
	private String phone;
	
	
}
