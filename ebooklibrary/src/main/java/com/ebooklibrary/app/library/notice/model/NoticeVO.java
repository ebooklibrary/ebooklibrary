package com.ebooklibrary.app.library.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int noticeNo; //공지사항 번호 
	private String title;  // 공지사항 제목
	private String userName;  // 공지사항 작성자
	private Timestamp regdate; // 공지사항 작성일
	private String content; //공지사항 내용
	private int readCount; //조회수
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
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
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", title=" + title + ", userName=" + userName + ", regdate=" + regdate
				+ ", content=" + content + ", readCount=" + readCount + "]";
	}


	
}	
