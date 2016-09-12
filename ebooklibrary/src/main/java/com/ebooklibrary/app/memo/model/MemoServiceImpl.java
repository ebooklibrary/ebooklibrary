package com.ebooklibrary.app.memo.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemoServiceImpl implements MemoService{
	
	@Autowired
	private MemoDAO memoDao;
	
	public int memoCount(String toId){
		return memoDao.memoCount(toId);
	}
}
