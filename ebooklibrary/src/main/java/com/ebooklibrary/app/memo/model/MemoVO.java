package com.ebooklibrary.app.memo.model;

import java.sql.Timestamp;

public class MemoVO {
	private int memoNo;
	private String toId;//받는사람
	private String fromId;//보낸사람
	public int getMemoNo() {
		return memoNo;
	}
	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}
	private String checked;//확인여부
	private Timestamp sendDate;//보낸시간
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
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
	public Timestamp getSendDate() {
		return sendDate;
	}
	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
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
		return "MemoVO [memoNo=" + memoNo + ", toId=" + toId + ", fromId=" + fromId + ", checked=" + checked
				+ ", sendDate=" + sendDate + ", title=" + title + ", content=" + content + "]";
	}
	
	
	
}
