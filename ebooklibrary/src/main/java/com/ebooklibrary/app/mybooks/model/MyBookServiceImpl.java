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

	@Override
	public List<MyBookVO> selectCartByUserId(String userId) {
		return myBookDao.selectCartByUserId(userId);
	}

	@Override
	public MyBookVO selectBookDetail(int bookNo) {
		/*return myBookDao.selectBookDetail(bookNo);*/
		
		MyBookVO bookVo=myBookDao.selectBookDetail(bookNo);
		
		BookUtility bu=new BookUtility();
		
		String genre= bu.getGenre(Integer.parseInt(bookVo.getGenre()));
		bookVo.setGenre(genre);
		
		return bookVo;
		
	}

	@Override
	public int deleteBooks(int bookNo) {
		
		int flag=myBookDao.flagDeleteBooks(bookNo);
		int cnt=0;
		if (flag<1) {
			cnt=myBookDao.deleteBooks(bookNo);
		}
		return cnt;
	}

	@Override
	public int flagDeleteBooks(int bookNo) {
		return myBookDao.flagDeleteBooks(bookNo);
	}

	@Override
	public int bookEdit(MyBookVO myBookVo) {
		return myBookDao.bookEdit(myBookVo);
	}

	@Override
	public MyBooksVO selectMyBooksByBookNo(MyBooksVO myBooksVo) {
		return myBookDao.selectMyBooksByBookNo(myBooksVo);
	}

	@Override
	public int showHideMyBook(MyBooksVO myBooksVo) {
		int cnt=0;
		String hide=myBooksVo.getHide();
		if (hide.equals("N")) {
			System.out.println("toHide");
			cnt=myBookDao.hideMyBook(myBooksVo);
		}else if (hide.equals("Y")) {
			System.out.println("toShow");
			cnt=myBookDao.showMyBook(myBooksVo);
		}
		
		return cnt;
	}

	@Override
	public int countschFromMain(BookSearchVO bookSearchVo) {
		System.out.println(bookSearchVo);
		return myBookDao.countschFromMain(bookSearchVo);
	}
}
