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
	public MyBooksVO selectMyBooksByUserId(String userId) {
		return getSqlSession().selectOne(namespace+".selectMyBooksByUserId", userId);
	}

	
	
}
