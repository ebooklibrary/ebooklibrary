package com.ebooklibrary.app.shop.order.model;

import java.sql.Timestamp;

public class OrderVO {

	private int ordersNo;				
	private String userId;				
	private int price;					
	private Timestamp ordersDate;	
	private int bookNo;
	private String buyClass;
	private String impUid;
	private String merchantUid;
	private String applyNum;
	
	
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
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
	public Timestamp getOrdersDate() {
		return ordersDate;
	}
	public void setOrdersDate(Timestamp ordersDate) {
		this.ordersDate = ordersDate;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getBuyClass() {
		return buyClass;
	}
	public void setBuyClass(String buyClass) {
		this.buyClass = buyClass;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	public String getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}
	
	@Override
	public String toString() {
		return "OrderVO [ordersNo=" + ordersNo + ", userId=" + userId + ", price=" + price + ", ordersDate="
				+ ordersDate + ", bookNo=" + bookNo + ", buyClass=" + buyClass + ", impUid=" + impUid + ", merchantUid="
				+ merchantUid + ", applyNum=" + applyNum + "]";
	}
	
	
}
