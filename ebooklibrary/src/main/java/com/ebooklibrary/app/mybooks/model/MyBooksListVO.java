package com.ebooklibrary.app.mybooks.model;

import java.util.List;

public class MyBooksListVO {
	
	private List<MyBooksVO> myBooksVo;

	public List<MyBooksVO> getMyBooksVo() {
		return myBooksVo;
	}

	public void setMyBooksVo(List<MyBooksVO> myBooksVo) {
		this.myBooksVo = myBooksVo;
	}

	@Override
	public String toString() {
		return "MyBooksListVO [myBooksVo=" + myBooksVo + "]";
	}
	
	
	
}
