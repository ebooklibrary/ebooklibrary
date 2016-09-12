package com.ebooklibrary.app.mybooks.model;

import java.util.List;
import java.util.Map;

public interface MyBookService {

	public int insertBook(MyBookVO myBookVo);
	public List<Map<String, Object>> selectBookByUserId(String userId);
	public MyBookVO selectBookByBookNo(int bookNo);
	public List<MyBooksVO> selectMyBooksByUserId(String userId);
	public List<MyBookVO> selectBoolAll(BookSearchVO bookSearchVo);
	
}
