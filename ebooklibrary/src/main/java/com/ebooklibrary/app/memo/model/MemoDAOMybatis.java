package com.ebooklibrary.app.memo.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemoDAOMybatis extends SqlSessionDaoSupport implements MemoDAO {
	private String namespace="config.mybatis.mapper.oracle.memo";
	
	public int memoCount(String toId){
		 return getSqlSession().selectOne(namespace+".selectMemoCount", toId);
	}

	@Override
	public List<MemoVO> selectToId(String userId) {
		return getSqlSession().selectList(namespace+".selectToId", userId);
	}

	@Override
	public List<MemoVO> selectFromId(String userId) {
		return getSqlSession().selectList(namespace+".selectFromId", userId);
	}

	@Override
	public int insertMemo(MemoVO memoVo) {
		return getSqlSession().insert(namespace+".insertMemo", memoVo);
	}

	@Override
	public int updateMemoChecked(int memoNo) {
		return getSqlSession().update(namespace+".updateMemoChecked", memoNo);
	}

	@Override
	public int deleteMemo(int memoNo) {
		return getSqlSession().delete(namespace+".deleteMemo", memoNo);
	}
}
