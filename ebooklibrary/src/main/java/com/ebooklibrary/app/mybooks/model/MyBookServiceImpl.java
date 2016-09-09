package com.ebooklibrary.app.mybooks.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
