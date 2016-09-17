package com.ebooklibrary.app.common;

public class MemoSearchVO extends SearchVO{
	public String userId;
	public String toFrom;

	public String getToFrom() {
		return toFrom;
	}

	public void setToFrom(String toFrom) {
		this.toFrom = toFrom;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "MemoSearchVO [userId=" + userId + ", toFrom=" + toFrom + ", toString()=" + super.toString() + "]";
	}
	
	
}
