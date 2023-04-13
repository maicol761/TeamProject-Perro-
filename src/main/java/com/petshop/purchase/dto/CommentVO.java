package com.petshop.purchase.dto;

import java.sql.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class CommentVO {
private String content;
private Date regdate;
//private Date modifydate;
private int pno;
private int comment_seq;
private int star;
private String writer;
private String mid;

}

