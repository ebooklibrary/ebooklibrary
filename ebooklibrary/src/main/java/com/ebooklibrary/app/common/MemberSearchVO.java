package com.ebooklibrary.app.common;

public class MemberSearchVO extends SearchVO {
	private int memberNo;
	private String myWrite;

	
	public String getMyWrite() {
		return myWrite;
	}

	public void setMyWrite(String myWrite) {
		this.myWrite = myWrite;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "MemberSearchVO [memberNo=" + memberNo + ", myWrite=" + myWrite + ", toString()=" + super.toString()
				+ "]";
	}


	
}
