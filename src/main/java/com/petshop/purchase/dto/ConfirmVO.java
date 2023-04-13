package com.petshop.purchase.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ConfirmVO {
	
	private int cono;
	private String mid;
	private Date codate;
	private int copay;
	private String coname;
	private String result;

}
