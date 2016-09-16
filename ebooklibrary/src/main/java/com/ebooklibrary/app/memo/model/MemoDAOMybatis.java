package com.ebooklibrary.app.memo.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.ebooklibrary.app.common.MemoSearchVO;

@Repository
public class MemoDAOMybatis extends SqlSessionDaoSupport implements MemoDAO {
	private String namespace="config.mybatis.mapper.oracle.memo";
	
	public int memoCount(String toId){
		 return getSqlSession().selectOne(namespace+".selectMemoCount", toId);
	}

	@Override
	public List<MemoVO> selectToId(MemoSearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectToId", searchVo);
	}

	@Override
	public List<MemoVO> selectFromId(MemoSearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectFromId", searchVo);
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

	@Override
	public int selectToIdCount(MemoSearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectToIdCount", searchVo);
	}

	@Override
	public int selectFromIdCount(MemoSearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectFromIdCount", searchVo);
	}
}
