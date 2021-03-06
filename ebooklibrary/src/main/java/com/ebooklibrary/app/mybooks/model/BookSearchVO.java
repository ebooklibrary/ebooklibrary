package com.ebooklibrary.app.mybooks.model;

import java.sql.Timestamp;

import com.ebooklibrary.app.common.SearchVO;

public class BookSearchVO extends SearchVO {

	private int bookNo; //책번호
	private String userId;
	private String title; //책제목
	private String publisher; //출판사
	private String writer; //작가
	private String publication; //출판일
	private Timestamp reg_date; //등록일
	private String genre; //장르
	private int price; //가격
	private int sales; //판매부수
	private String bookSort; //책정렬
	private String searchKeyword; //메인쪽 서치키워드
	
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public String getBookSort() {
		return bookSort;
	}
	public void setBookSort(String bookSort) {
		this.bookSort = bookSort;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "BookSearchVO [bookNo=" + bookNo + ", userId=" + userId + ", title=" + title + ", publisher=" + publisher
				+ ", writer=" + writer + ", publication=" + publication + ", reg_date=" + reg_date + ", genre=" + genre
				+ ", price=" + price + ", sales=" + sales + ", bookSort=" + bookSort + ", searchKeyword="
				+ searchKeyword + "]";
	}
	
}
