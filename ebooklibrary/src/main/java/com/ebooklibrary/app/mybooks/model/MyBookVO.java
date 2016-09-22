package com.ebooklibrary.app.mybooks.model;

import java.sql.Timestamp;

public class MyBookVO {
	
	private int bookNo; //책번호
	private String title; //책제목
	private String publisher; //출판사
	private String writer; //작가
	private String publication; //출판일
	private Timestamp regDate; //등록일
	private String genre; //장르
	private int price; //가격
	private String summary; //요약
	private int sales; //판매부수
	private String bookFileName; //책파일이름
	private String coverFileName; //책커버이름
	private long bookFileSize; //책파일사이즈
	
	private String userId; //뷰용 유저아이디

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublication() {
		return publication;
	}

	public void setPublication(String publication) {
		this.publication = publication;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public String getBookFileName() {
		return bookFileName;
	}

	public void setBookFileName(String bookFileName) {
		this.bookFileName = bookFileName;
	}

	public String getCoverFileName() {
		return coverFileName;
	}

	public void setCoverFileName(String coverFileName) {
		this.coverFileName = coverFileName;
	}

	public long getBookFileSize() {
		return bookFileSize;
	}

	public void setBookFileSize(long bookFileSize) {
		this.bookFileSize = bookFileSize;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "MyBookVO [bookNo=" + bookNo + ", title=" + title + ", publisher=" + publisher + ", writer=" + writer
				+ ", publication=" + publication + ", regDate=" + regDate + ", genre=" + genre + ", price=" + price
				+ ", summary=" + summary + ", sales=" + sales + ", bookFileName=" + bookFileName + ", coverFileName="
				+ coverFileName + ", bookFileSize=" + bookFileSize + ", userId=" + userId + "]";
	}
	
}
