package com.ebooklibrary.app.visitor.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class VisitorDAOMybatis extends SqlSessionDaoSupport implements VisitorDAO {
	private String namespace="config.mybatis.mapper.oracle.visitor";
	
	public int selectMaxDate(){
		return getSqlSession().selectOne(namespace+".selectMaxDate");
	}

	@Override
	public int insertSysdate() {
		return getSqlSession().insert(namespace+".insertSysdate");
	}
	
	public int selectTotalSum(){
		return getSqlSession().selectOne(namespace+".selectTotalSum");
	}

	@Override
	public int updateTotalVisitor(int totalVisitor) {
		return getSqlSession().update(namespace+".updateTotalVisitor", totalVisitor);
	}

	@Override
	public int updateTodayVisitor() {
		return getSqlSession().update(namespace+".updateTodayVisitor");
	}

	@Override
	public VisitorVO selectToday() {
		return getSqlSession().selectOne(namespace+".selectToday");
	}
}
