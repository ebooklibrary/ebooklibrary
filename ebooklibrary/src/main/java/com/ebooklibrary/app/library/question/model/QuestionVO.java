package com.ebooklibrary.app.library.question.model;

import java.sql.Timestamp;

public class QuestionVO {
	
	private int questNo;
	private String title;
	private String userName;
	private String oContent;
	private String qContent;
	private Timestamp redDate;
	private String selectCmt;
	private int memberNo;
	private String fileName;
	private long fileSize;
	private String category;
	public int getQuestNo() {
		return questNo;
	}
	public void setQuestNo(int questNo) {
		this.questNo = questNo;
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
	public String getoContent() {
		return oContent;
	}
	public void setoContent(String oContent) {
		this.oContent = oContent;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public Timestamp getRedDate() {
		return redDate;
	}
	public void setRedDate(Timestamp redDate) {
		this.redDate = redDate;
	}
	public String getSelectCmt() {
		return selectCmt;
	}
	public void setSelectCmt(String selectCmt) {
		this.selectCmt = selectCmt;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "QuestionVO [questNo=" + questNo + ", title=" + title + ", userName=" + userName + ", oContent="
				+ oContent + ", qContent=" + qContent + ", redDate=" + redDate + ", selectCmt=" + selectCmt
				+ ", memberNo=" + memberNo + ", fileName=" + fileName + ", fileSize=" + fileSize + ", category="
				+ category + "]";
	}
	
	
}
