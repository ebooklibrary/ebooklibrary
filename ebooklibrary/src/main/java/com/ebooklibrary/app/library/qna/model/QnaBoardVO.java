package com.ebooklibrary.app.library.qna.model;

import java.sql.Timestamp;

public class QnaBoardVO {
	private int qnaNo;
	private String title;
	private String userName;
	private Timestamp regDate;
	private String content;
	private int readCount;
	private int memberNo;
	private String complete;
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
	@Override
	public String toString() {
		return "QnaBoardVO [qnaNo=" + qnaNo + ", title=" + title + ", userName=" + userName + ", regDate=" + regDate
				+ ", content=" + content + ", readCount=" + readCount + ", memberNo=" + memberNo + ", complete="
				+ complete + "]";
	}
	
	
	
	
}
