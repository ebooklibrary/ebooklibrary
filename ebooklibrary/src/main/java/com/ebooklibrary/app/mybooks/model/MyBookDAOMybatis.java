package com.ebooklibrary.app.mybooks.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class MyBookDAOMybatis extends SqlSessionDaoSupport implements MyBookDAO {

	private static final Logger logger=LoggerFactory.getLogger(MyBookDAOMybatis.class);
	
	private String namespace="config.mybatis.mapper.oracle.book";
	
	@Override
	public int insertBook(MyBookVO myBookVo) {
		return getSqlSession().insert(namespace+".insertBook", myBookVo);
	}

	@Override
	public List<Map<String, Object>> selectBookByUserId(String userId) {
		return getSqlSession().selectList(namespace+".selectBookByUserId", userId);
	}

	@Override
	public MyBookVO selectBookByBookNo(int bookNo) {
		return getSqlSession().selectOne(namespace+".selectBookByBookNo", bookNo);
	}

	@Override
	public List<MyBooksVO> selectMyBooksByUserId(String userId) {
		return getSqlSession().selectList(namespace+".selectMyBooksByUserId", userId);
	}

	@Override
	public List<MyBookVO> selectBoolAll(BookSearchVO bookSearchVo) {
		return getSqlSession().selectList(namespace+".selectBoolAll", bookSearchVo);
	}

	@Override
	public int countAllBook(BookSearchVO bookSearchVo) {
		return getSqlSession().selectOne(namespace+".countAllBook", bookSearchVo);
	}

	@Override
	public List<MyBookVO> schFromMain(BookSearchVO bookSearchVo) {
		return getSqlSession().selectList(namespace+".schFromMain", bookSearchVo);
	}

	@Override
	public List<Map<String, Object>> selectMyBookListByUserId(BookSearchVO bookSearchVo) {
		return getSqlSession().selectList(namespace+".selectMyBookListByUserId", bookSearchVo);
	}

	@Override
	public int deleteMybook(MyBooksVO myBooksVo) {
		return getSqlSession().delete(namespace+".deleteMybook", myBooksVo);
	}

	@Override
	public int myBookCount(BookSearchVO bookSearchVo) {
		return getSqlSession().selectOne(namespace+".myBookCount", bookSearchVo);
	}

	@Override
	public List<MyBookVO> selectCartByUserId(String userId) {
		return getSqlSession().selectList(namespace+".selectCartByUserId", userId);
	}

	@Override
	public MyBookVO selectBookDetail(int bookNo) {
		return getSqlSession().selectOne(namespace+".selectBookDetail", bookNo);
	}

	@Override
	public int deleteBooks(int bookNo) {
		return getSqlSession().delete(namespace+".deleteBooks", bookNo);
	}

	@Override
	public int flagDeleteBooks(int bookNo) {
		return getSqlSession().selectOne(namespace+".flagDeleteBooks", bookNo);
	}

	@Override
	public int bookEdit(MyBookVO myBookVo) {
		return getSqlSession().update(namespace+".bookEdit", myBookVo);
	}

	@Override
	public MyBooksVO selectMyBooksByBookNo(MyBooksVO myBooksVo) {
		return getSqlSession().selectOne(namespace+".selectMyBooksByBookNo", myBooksVo);
	}

	@Override
	public int hideMyBook(MyBooksVO myBooksVo) {
		return getSqlSession().update(namespace+".hideMyBook", myBooksVo);
	}

	@Override
	public int showMyBook(MyBooksVO myBooksVo) {
		return getSqlSession().update(namespace+".showMyBook", myBooksVo);
	}

	@Override
	public int countschFromMain(BookSearchVO bookSearchVo) {
		return getSqlSession().selectOne(namespace+".countschFromMain", bookSearchVo);
	}

	
	
}
