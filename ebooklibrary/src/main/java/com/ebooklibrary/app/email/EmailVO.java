package com.ebooklibrary.app.email;

public class EmailVO {
	private String subject;
	private String content;
	private String receiver;
	private String sender;
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	@Override
	public String toString() {
		return "EmailVO [subject=" + subject + ", content=" + content + ", receiver=" + receiver + ", sender=" + sender
				+ "]";
	}
	
	
}
