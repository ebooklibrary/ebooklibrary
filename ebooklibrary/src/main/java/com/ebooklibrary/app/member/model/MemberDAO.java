package com.ebooklibrary.app.member.model;

import java.util.List;

import com.ebooklibrary.app.common.SearchVO;

public interface MemberDAO {
	public int register(MemberVO vo);
	public String logincheck(String userName);
	public MemberVO selectByUserName(String userName);
	public List<MemberVO> selectMemberAll(SearchVO vo);
	public int selectMemberCount(SearchVO vo);
	public int selectMemberCheckId(String userId);
	public int updateBackImg(MemberVO vo);
	public String selectBymemberVo(MemberVO vo);
	public int updateTempPwd(MemberVO vo);
}
