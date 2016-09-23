package com.ebooklibrary.app.mybooks.model;

import java.sql.Timestamp;

public class MyBooksVO{

	private int myBookNo;
	private int bookNo;
	private Timestamp rentStart;
	private Timestamp rentEnd;
	private int price;
	private String userId;
	private String hide;
	
	
	public int getMyBookNo() {
		return myBookNo;
	}
	public void setMyBookNo(int myBookNo) {
		this.myBookNo = myBookNo;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public Timestamp getRentStart() {
		return rentStart;
	}
	public void setRentStart(Timestamp rentStart) {
		this.rentStart = rentStart;
	}
	public Timestamp getRentEnd() {
		return rentEnd;
	}
	public void setRentEnd(Timestamp rentEnd) {
		this.rentEnd = rentEnd;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getHide() {
		return hide;
	}
	public void setHide(String hide) {
		this.hide = hide;
	}
	@Override
	public String toString() {
		return "MyBooksVO [myBookNo=" + myBookNo + ", bookNo=" + bookNo + ", rentStart=" + rentStart + ", rentEnd="
				+ rentEnd + ", price=" + price + ", userId=" + userId + ", hide=" + hide + "]";
	}
	
}
