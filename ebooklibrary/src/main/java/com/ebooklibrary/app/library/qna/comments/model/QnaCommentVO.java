package com.ebooklibrary.app.library.qna.comments.model;

import java.sql.Timestamp;

public class QnaCommentVO {
	private int commentNo;
	private int qnaNo;
	private int memberNo;
	private String userName;
	private String content;
	private int groupNo;
	private int sortNo;
	private int stepNo;
	private Timestamp regDate;
	
	
	
	public int getStepNo() {
		return stepNo;
	}

	public void setStepNo(int stepNo) {
		this.stepNo = stepNo;
	}

	public QnaCommentVO() {
		super();
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "QnaCommentVO [commentNo=" + commentNo + ", qnaNo=" + qnaNo + ", memberNo=" + memberNo + ", userName="
				+ userName + ", content=" + content + ", groupNo=" + groupNo + ", sortNo=" + sortNo + ", regDate="
				+ regDate + "]";
	}
	
	
	
	
}
