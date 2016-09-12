package com.ebooklibrary.app.mybooks.model;

import java.sql.Timestamp;

public class MyBookVO {
	
	private int bookNo; //책번호
	private String title; //책제목
	private String publisher; //출판사
	private String writer; //작가
	private String publication; //출판일
	private Timestamp reg_date; //등록일
	private String genre; //장르
	private int price; //가격
	private String summary; //요약
	private int sales; //판매부수
	private String bookFileName; //책파일이름
	private String coverFileName; //책커버이름
	private long bookFileSize; //책파일사이즈
	
	public MyBookVO() {
		super();
	}

	public MyBookVO(int bookNo, String title, String publisher, String writer, String publication, Timestamp reg_date,
			String genre, int price, String summary, int sales, String bookFileName, String coverFileName,
			long bookFileSize) {
		super();
		this.bookNo = bookNo;
		this.title = title;
		this.publisher = publisher;
		this.writer = writer;
		this.publication = publication;
		this.reg_date = reg_date;
		this.genre = genre;
		this.price = price;
		this.summary = summary;
		this.sales = sales;
		this.bookFileName = bookFileName;
		this.coverFileName = coverFileName;
		this.bookFileSize = bookFileSize;
	}

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

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
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

	@Override
	public String toString() {
		return "MyBookVO [bookNo=" + bookNo + ", title=" + title + ", publisher=" + publisher + ", writer=" + writer
				+ ", publication=" + publication + ", reg_date=" + reg_date + ", genre=" + genre + ", price=" + price
				+ ", summary=" + summary + ", sales=" + sales + ", bookFileName=" + bookFileName + ", coverFileName="
				+ coverFileName + ", bookFileSize=" + bookFileSize + "]";
	}

}
