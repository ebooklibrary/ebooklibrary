package com.ebooklibrary.app.memo.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebooklibrary.app.common.MemoSearchVO;

@Service
public class MemoServiceImpl implements MemoService{
	
	@Autowired
	private MemoDAO memoDao;
	
	public int memoCount(String toId){
		return memoDao.memoCount(toId);
	}

	@Override
	public List<MemoVO> selectToId(MemoSearchVO searchVo) {
		return memoDao.selectToId(searchVo);
		
	}

	@Override
	public List<MemoVO> selectFromId(MemoSearchVO searchVo) {
		return memoDao.selectFromId(searchVo);
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

	@Override
	public int selectToIdCount(MemoSearchVO searchVo) {
		return memoDao.selectToIdCount(searchVo);
	}

	@Override
	public int selectFromIdCount(MemoSearchVO searchVo) {
		return memoDao.selectFromIdCount(searchVo);
	}
	
	
}
