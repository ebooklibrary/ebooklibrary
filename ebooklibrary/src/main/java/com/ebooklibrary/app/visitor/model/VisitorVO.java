package com.ebooklibrary.app.visitor.model;

import java.sql.Date;

public class VisitorVO {
	private Date dailyDate;
	private int todayVisitor;
	private int totalVisitor;
	public Date getDailyDate() {
		return dailyDate;
	}
	public void setDailyDate(Date dailyDate) {
		this.dailyDate = dailyDate;
	}
	public int getTodayVisitor() {
		return todayVisitor;
	}
	public void setTodayVisitor(int todayVisitor) {
		this.todayVisitor = todayVisitor;
	}
	public int getTotalVisitor() {
		return totalVisitor;
	}
	public void setTotalVisitor(int totalVisitor) {
		this.totalVisitor = totalVisitor;
	}
	@Override
	public String toString() {
		return "VisitorVO [dailyDate=" + dailyDate + ", todayVisitor=" + todayVisitor + ", totalVisitor=" + totalVisitor
				+ "]";
	}
	
	
	
}
