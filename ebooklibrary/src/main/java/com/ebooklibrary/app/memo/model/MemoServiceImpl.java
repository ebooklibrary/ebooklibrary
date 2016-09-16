package com.ebooklibrary.app.memo.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemoServiceImpl implements MemoService{
	
	@Autowired
	private MemoDAO memoDao;
	
	public int memoCount(String toId){
		return memoDao.memoCount(toId);
	}

	@Override
	public List<MemoVO> selectToId(String userId) {
		return memoDao.selectToId(userId);
		
	}

	@Override
	public List<MemoVO> selectFromId(String userId) {
		return memoDao.selectFromId(userId);
	}

	@Override
	public int insertMemo(MemoVO memoVo) {
		return memoDao.insertMemo(memoVo);
	}

	@Override
	public int updateMemoChecked(int memoNo) {
		return memoDao.updateMemoChecked(memoNo);
	}

	@Override
	public int deleteMemo(int memoNo) {
		return memoDao.deleteMemo(memoNo);
	}
	
	
}
