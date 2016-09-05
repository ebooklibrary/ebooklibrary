package com.ebooklibrary.app.common;

public class MemberSearchVO extends SearchVO {
	private int memberNo;

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "MemberSearchVO [memberNo=" + memberNo + "]";
	}
	
	
}
