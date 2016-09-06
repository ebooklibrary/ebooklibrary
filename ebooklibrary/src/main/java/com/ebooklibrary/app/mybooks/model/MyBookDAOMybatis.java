package com.ebooklibrary.app.mybooks.model;

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

	
	
}
