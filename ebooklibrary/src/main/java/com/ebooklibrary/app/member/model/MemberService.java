package com.ebooklibrary.app.member.model;

import java.util.List;

import com.ebooklibrary.app.common.SearchVO;

public interface MemberService {
	//로그인 처리
	public static final int LOGIN_OK=1;
	public static final int PWD_DISAGREE=2;
	public static final int ID_NONE=3;
	
	
	
	public int register(MemberVO vo);
	public int logincheck(String userName,String pwd);
	public MemberVO selectByUserName(String userName);
	public List<MemberVO> selectMemberAll(SearchVO vo);
	public int selectMemberCount(SearchVO vo);
}
