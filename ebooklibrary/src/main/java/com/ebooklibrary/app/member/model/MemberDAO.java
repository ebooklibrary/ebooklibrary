package com.ebooklibrary.app.member.model;

public interface MemberDAO {
	public int register(MemberVO vo);
	public String logincheck(String userName);
	public MemberVO selectByUserName(String userName);
}
