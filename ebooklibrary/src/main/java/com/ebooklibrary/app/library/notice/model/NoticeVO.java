package com.ebooklibrary.app.library.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int notice_No; //공지사항 번호 
	private String title;  // 공지사항 제목
	private String writer;  // 공지사항 작성자
	private Timestamp regdate; // 공지사항 작성일
	private String content; //공지사항 내용
	private int read_Count; //조회수
	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeVO(int notice_No, String title, String writer, Timestamp regdate, String content, int read_Count) {
		super();
		this.notice_No = notice_No;
		this.title = title;
		this.writer = writer;
		this.regdate = regdate;
		this.content = content;
		this.read_Count = read_Count;
	}
	public int getNotice_No() {
		return notice_No;
	}
	public void setNotice_No(int notice_No) {
		this.notice_No = notice_No;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRead_Count() {
		return read_Count;
	}
	public void setRead_Count(int read_Count) {
		this.read_Count = read_Count;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_No=" + notice_No + ", title=" + title + ", writer=" + writer + ", regdate=" + regdate
				+ ", content=" + content + ", read_Count=" + read_Count + "]";
	}

	
}	
