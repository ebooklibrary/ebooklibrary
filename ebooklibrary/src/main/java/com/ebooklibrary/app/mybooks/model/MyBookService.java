package com.ebooklibrary.app.mybooks.model;

import java.util.List;
import java.util.Map;

public interface MyBookService {

	public int insertBook(MyBookVO myBookVo);
	public List<Map<String, Object>> selectBookByUserId(String userId);
	public MyBookVO selectBookByBookNo(int bookNo);
	public List<MyBooksVO> selectMyBooksByUserId(String userId);
	public List<MyBookVO> selectBoolAll(BookSearchVO bookSearchVo);
	public int countAllBook(BookSearchVO bookSearchVo);
	public List<Map<String, Object>> selectMyBookListByUserId(BookSearchVO bookSearchVo);
	public int myBookCount(BookSearchVO bookSearchVo);
	public int deleteMybook(MyBooksVO myBooksVo);
	public MyBookVO selectBookDetail(int bookNo);
	public List<MyBookVO> selectCartByUserId(String userId);
	public int deleteBooks(int bookNo);
	public int flagDeleteBooks(int bookNo);
}
