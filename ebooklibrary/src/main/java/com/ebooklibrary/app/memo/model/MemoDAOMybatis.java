package com.ebooklibrary.app.memo.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemoDAOMybatis extends SqlSessionDaoSupport implements MemoDAO {
	private String namespace="config.mybatis.mapper.oracle.memo";
	
	public int memoCount(String toId){
		 return getSqlSession().selectOne(namespace+".selectMemoCount", toId);
	}
}
