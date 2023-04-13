package com.petshop.purchase.dto;

public class CartViewVO {
	private int cart;
	private String mid;
	private int pno;
	private int qty;
	private String result;
	private String pname;
	private int wprice;
	private int margin;
	private String image;
	private int price;
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCart() {
		return cart;
	}
	public void setCart(int cart) {
		this.cart = cart;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
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
	public int getPrice() {
		   return (this.wprice * this.margin / 100)+this.wprice;
	}
	@Override
	public String toString() {
		return "CartViewVO [cart=" + cart + ", mid=" + mid + ", pno=" + pno + ", qty=" + qty + ", result=" + result
				+ ", pname=" + pname + ", wprice=" + wprice + ", margin=" + margin + ", price=" + price + "]";
	}
	
	
}
	