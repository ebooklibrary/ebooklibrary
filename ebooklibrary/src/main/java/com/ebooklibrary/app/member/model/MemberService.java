package com.ebooklibrary.app.member.model;

import java.util.List;
import java.util.Map;

import com.ebooklibrary.app.common.SearchVO;

public interface MemberService {
	//회원가입 처리
	public static final int ID_OK=0;
	public static final int ID_NO=1;
	//로그인 처리
	public static final int LOGIN_OK=1;
	public static final int PWD_DISAGREE=2;
	public static final int ID_NONE=3;
	
	//기본 배경 화면
	public static final String DEFAULTIMAGE="defaultimage.jpg";
	
	public int register(MemberVO vo);
	public int logincheck(String userName,String pwd);
	public MemberVO selectByUserName(String userName);
	public List<MemberVO> selectMemberAll(SearchVO vo);
	public int selectMemberCount(SearchVO vo);
	public int selectMemberCheckId(String userId);
	public int updateBackImg(MemberVO vo);
	public String selectBymemberVo(MemberVO vo);
	public int updateTempPwd(MemberVO vo);
	public int updateUserInfo(MemberVO vo);
	public int updateCash(Map<String, Object> map);
	
}
