package com.petshop.purchase.dto;

import lombok.ToString;

@ToString
public class ProductVO {
 private int pno;
 private String pname;
 private String content;
 private String image;
 private int wprice;
 private int margin;
 private int qty;
 private int cno;
 private int price;
public int getPno() {
   return pno;
}
public void setPno(int pno) {
   this.pno = pno;
}
public String getPname() {
   return pname;
}
public void setPname(String pname) {
   this.pname = pname;
}
public String getContent() {
   return content;
}
public void setContent(String content) {
   this.content = content;
}
public String getImage() {
   return image;
}
public void setImage(String image) {
   this.image = image;
}
public int getWprice() {
   return wprice;
}
public void setWprice(int wprice) {
   this.wprice = wprice;
}
public int getMargin() {
   return margin;
}
public void setMargin(int margin) {
   this.margin = margin;
}
public int getQty() {
   return qty;
}
public void setQty(int qty) {
   this.qty = qty;
}
public int getCno() {
   return cno;
}
public void setCno(int cno) {
   this.cno = cno;
}
public int getPrice() {
	   return (this.wprice * this.margin / 100)+this.wprice;
}

}