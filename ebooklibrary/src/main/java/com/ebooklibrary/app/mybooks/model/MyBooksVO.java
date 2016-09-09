package com.ebooklibrary.app.mybooks.model;

import java.sql.Timestamp;

public class MyBooksVO {

	private int myBookNo;
	private int bookNo;
	private Timestamp rentStart;
	private Timestamp rentEnd;
	private int price;
	private String userId;
	
	public MyBooksVO() {
		super();
	}

	public MyBooksVO(int myBookNo, int bookNo, Timestamp rentStart, Timestamp rentEnd, int price, String userId) {
		super();
		this.myBookNo = myBookNo;
		this.bookNo = bookNo;
		this.rentStart = rentStart;
		this.rentEnd = rentEnd;
		this.price = price;
		this.userId = userId;
	}

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

	@Override
	public String toString() {
		return "MyBooksVO [myBookNo=" + myBookNo + ", bookNo=" + bookNo + ", rentStart=" + rentStart + ", rentEnd="
				+ rentEnd + ", price=" + price + ", userId=" + userId + "]";
	}
	
}
