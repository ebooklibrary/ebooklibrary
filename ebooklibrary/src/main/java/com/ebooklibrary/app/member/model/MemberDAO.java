package com.ebooklibrary.app.member.model;

import java.util.List;
import java.util.Map;

import com.ebooklibrary.app.common.SearchVO;

public interface MemberDAO {
	public int register(MemberVO vo);
	public String logincheck(MemberVO vo);
	public MemberVO selectByUserName(String userName);
	public List<MemberVO> selectMemberAll(SearchVO vo);
	public int selectMemberCount(SearchVO vo);
	public int selectMemberCheckId(String userId);
	public int updateBackImg(MemberVO vo);
	public String selectBymemberVo(MemberVO vo);
	public int updateTempPwd(MemberVO vo);
	public int updateUserInfo(MemberVO vo);
	public int updateCash(Map<String, Object> map);
	public int outMember(String userId);
	
}
