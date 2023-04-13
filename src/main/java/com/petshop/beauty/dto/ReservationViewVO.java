package com.petshop.beauty.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationViewVO {
	
	private String vmid;
	private String vrrdate;
	private String vrtime;
	private String vrteacher;
	private String vdogweight;
	private String vbreed;
	private String vsname;
	private int vrprice;

}
