package com.ebooklibrary.app.library.request.model;

import java.sql.Timestamp;

public class RequestVO {
	private int requestNo;
	private String title;
	private String writer;
	private Timestamp regdate;
	private String publisher;
	private String stocked;
	private int memberNo;
	private String userName;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getRequestNo() {
		return requestNo;
	}
	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getStocked() {
		return stocked;
	}
	public void setStocked(String stocked) {
		this.stocked = stocked;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "RequestVO [requestNo=" + requestNo + ", title=" + title + ", writer=" + writer + ", regdate=" + regdate
				+ ", publisher=" + publisher + ", stocked=" + stocked + ", memberNo=" + memberNo + ", userName="
				+ userName + "]";
	}
	
	
	
}
