package com.ebooklibrary.app.mybooks.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebooklibrary.app.common.BookUtility;

@Service
public class MyBookServiceImpl implements MyBookService {

	@Autowired
	private MyBookDAO myBookDao;

	@Override
	public int insertBook(MyBookVO myBookVo) {
		return myBookDao.insertBook(myBookVo);
	}

	@Override
	public List<Map<String, Object>> selectBookByUserId(String userId) {
		return myBookDao.selectBookByUserId(userId);
	}

	@Override
	public MyBookVO selectBookByBookNo(int bookNo) {
		return myBookDao.selectBookByBookNo(bookNo);
	}

	@Override
	public List<MyBooksVO> selectMyBooksByUserId(String userId) {
		return myBookDao.selectMyBooksByUserId(userId);
	}

	@Override
	public List<MyBookVO> selectBoolAll(BookSearchVO bookSearchVo) {
		List<MyBookVO> alist= myBookDao.selectBoolAll(bookSearchVo);
		BookUtility bu=new BookUtility();
		for (MyBookVO myBookVo : alist) {
			String genre= bu.getGenre(Integer.parseInt(myBookVo.getGenre()));
			myBookVo.setGenre(genre);
		}
		
		return alist;
	}

	@Override
	public int countAllBook(BookSearchVO bookSearchVo) {
		return myBookDao.countAllBook(bookSearchVo);
	}
	
}
