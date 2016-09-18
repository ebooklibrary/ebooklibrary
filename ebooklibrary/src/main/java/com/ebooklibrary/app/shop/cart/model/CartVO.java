package com.ebooklibrary.app.shop.cart.model;

import java.sql.Timestamp;

public class CartVO {
	private int cartNo;//일련번호
	private String  userId;//회원아이디
	private int  bookNo;//책번호
	private int  rentDate;//대여기간
	private String rentEnd; //대여 만료일
	private int price;//대여가격
	private Timestamp  regdate;//장바구니에 담은일자
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public int getRentDate() {
		return rentDate;
	}
	public void setRentDate(int rentDate) {
		this.rentDate = rentDate;
	}
	public String getRentEnd() {
		return rentEnd;
	}
	public void setRentEnd(String rentEnd) {
		this.rentEnd = rentEnd;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", userId=" + userId + ", bookNo=" + bookNo + ", rentDate=" + rentDate
				+ ", rentEnd=" + rentEnd + ", price=" + price + ", regdate=" + regdate + "]";
	}
	
}
