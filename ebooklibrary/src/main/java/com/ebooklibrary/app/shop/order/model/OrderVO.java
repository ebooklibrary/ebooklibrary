package com.ebooklibrary.app.shop.order.model;

import java.sql.Timestamp;

public class OrderVO {

	private int orderNo;				//주문번호
	private String userId;			//고객고유번호(회원아이디)(FK)
	private int price;			//주문총금액
	private Timestamp orderDate;		//주문일자
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", userId=" + userId + ", price=" + price + ", orderDate=" + orderDate
				+ "]";
	}	 
	 
	
}
