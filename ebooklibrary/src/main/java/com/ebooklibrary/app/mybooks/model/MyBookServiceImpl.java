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
		List<MyBookVO> alist=null;
		
		String keyword=bookSearchVo.getSearchKeyword();
		if (keyword!=null && !keyword.isEmpty()) {
			alist=myBookDao.schFromMain(bookSearchVo);
			System.out.println("메인 검색어"+keyword);
		}else{
			alist= myBookDao.selectBoolAll(bookSearchVo);
			System.out.println("내부 검색어"+keyword);
		}
		
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

	@Override
	public List<Map<String, Object>> selectMyBookListByUserId(BookSearchVO bookSearchVo) {
		return myBookDao.selectMyBookListByUserId(bookSearchVo);
	}

	@Override
	public int deleteMybook(MyBooksVO myBooksVo) {
		return myBookDao.deleteMybook(myBooksVo);
	}

	@Override
	public int myBookCount(BookSearchVO bookSearchVo) {
		return myBookDao.myBookCount(bookSearchVo);
	}
	
}
