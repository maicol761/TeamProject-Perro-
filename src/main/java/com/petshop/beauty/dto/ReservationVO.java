package com.petshop.beauty.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationVO {
	
	private int rno;
	private String mid;
	private String rrdate;
	private String rtime;
	private String rteacher;
	private String dogname;
	private String rphone;
	private String comment;
	private int rprice;
	private int dno;
	private int sno;
	
	private Date rtoday;
	
	@Override
	public String toString() {
		return rtime+rteacher;
	}
	
}
