package com.ebooklibrary.app.memo.model;

import java.util.Date;

public class MemoVO {
	private String toId;//받는사람
	private String fromId;//보낸사람
	private String check;//확인여부
	private Date sysdate;//보낸시간
	private String title;//제목
	private String content;//내용
	public String getToId() {
		return toId;
	}
	public void setToId(String toId) {
		this.toId = toId;
	}
	public String getFromId() {
		return fromId;
	}
	public void setFromId(String fromId) {
		this.fromId = fromId;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public Date getSysdate() {
		return sysdate;
	}
	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "MemoVO [toId=" + toId + ", fromId=" + fromId + ", check=" + check + ", sysdate=" + sysdate + ", title="
				+ title + ", content=" + content + "]";
	}
	
	
}
