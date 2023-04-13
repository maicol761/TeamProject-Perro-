package com.petshop.purchase.dto;

import java.sql.Date;

public class OrderResultViewVO {
private String pname;
private int qty;
private int wprice;
private int pno;
private int cono;
private String image;
private Date odate;
private int margin;
private String mid;
private String address;
private String phone;
private int price;
private int count;


public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public int getCono() {
	return cono;
}
public void setCono(int cono) {
	this.cono = cono;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public int getQty() {
	return qty;
}
public void setQty(int qty) {
	this.qty = qty;
}
public int getWprice() {
	return wprice;
}
public void setWprice(int wprice) {
	this.wprice = wprice;
}
public int getPno() {
	return pno;
}
public void setPno(int pno) {
	this.pno = pno;
}
public Date getOdate() {
	return odate;
}
public void setOdate(Date odate) {
	this.odate = odate;
}
public int getMargin() {
	return margin;
}
public void setMargin(int margin) {
	this.margin = margin;
}
public String getMid() {
	return mid;
}
public void setMid(String mid) {
	this.mid = mid;
}
public int getPrice() {
	   return (this.wprice * this.margin / 100)+this.wprice;
}


}
