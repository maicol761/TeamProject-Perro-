package com.petshop.beauty.dto;



import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class QVO {
	private int qno;
	private String mid;
	private String catego;
	private String qtitle;
	private String qcontent;
	private String acheck;
	private Date qdate;

}
