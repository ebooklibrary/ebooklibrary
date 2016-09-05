package com.ebooklibrary.app.mybooks.model;

import java.sql.Timestamp;

public class MyBookVO {
	
	private int bookNo;
	private String title;
	private String publisher;
	private String writer;
	private Timestamp publication;
	private Timestamp reg_date;
	private String genre;
	private int price;
	private String summary;
	private int sales;
	private String bookFileName;
	private String coverFileName;
	private int bookFileSize;
	
	public MyBookVO() {
		super();
	}

	public MyBookVO(int bookNo, String title, String publisher, String writer, Timestamp publication,
			Timestamp reg_date, String genre, int price, String summary, int sales, String bookFileName,
			String coverFileName, int bookFileSize) {
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

	public Timestamp getPublication() {
		return publication;
	}

	public void setPublication(Timestamp publication) {
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

	public int getBookFileSize() {
		return bookFileSize;
	}

	public void setBookFileSize(int bookFileSize) {
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
