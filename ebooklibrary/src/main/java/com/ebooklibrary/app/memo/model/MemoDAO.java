package com.ebooklibrary.app.memo.model;

import java.util.List;

public interface MemoDAO {
	public int memoCount(String toId);
	public List<MemoVO> selectToId(String userId);
	public List<MemoVO> selectFromId(String userId);
	public int insertMemo(MemoVO memoVo);
}
