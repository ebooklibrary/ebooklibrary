package com.ebooklibrary.app.library.qna.model;

import java.sql.Timestamp;

public class QnaBoardVO {
	private int qnaNo;
	private String title;
	private String writer;
	private Timestamp regDate;
	private String content;
	private int readCount;
	private int memberNo;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	@Override
	public String toString() {
		return "QnaBoardVO [qnaNo=" + qnaNo + ", title=" + title + ", writer=" + writer + ", regDate=" + regDate
				+ ", content=" + content + ", readCount=" + readCount + ", memberNo=" + memberNo + "]";
	}
	
	
	
}
