package com.ebooklibrary.app.library.ServiceCenter.Faq.model;

public class FaqVO {
	private int faqNo;
	private String category;
	private String title;
	private String content;
	private int yes;
	private int no;
	private int dontKnow;
	private String fixed;
	
	public String getFixed() {
		return fixed;
	}
	public void setFixed(String fixed) {
		this.fixed = fixed;
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public int getYes() {
		return yes;
	}
	public void setYes(int yes) {
		this.yes = yes;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getDontKnow() {
		return dontKnow;
	}
	public void setDontKnow(int dontKnow) {
		this.dontKnow = dontKnow;
	}
	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", yes=" + yes + ", no=" + no + ", dontKnow=" + dontKnow + ", fixed=" + fixed + "]";
	}
	
	
}
