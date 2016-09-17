package com.ebooklibrary.app.memo.model;

import java.util.List;

import com.ebooklibrary.app.common.MemoSearchVO;

public interface MemoService {
	public int memoCount(String toId);
	public List<MemoVO> selectToId(MemoSearchVO searchVo);
	public List<MemoVO> selectFromId(MemoSearchVO searchVo);
	public int insertMemo(MemoVO memoVo);
	public int updateMemoChecked(int memoNo);
	public int deleteMemo(int memoNo);
	public int selectToIdCount(MemoSearchVO searchVo);
	public int selectFromIdCount(MemoSearchVO searchVo);
}
