package com.petshop.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
			private String mname;
			private String mid;
			private String mpwd;
			private String mphone;
			private String maddr;
			private String email;
			private Integer aposition;
}
