package com.ebooklibrary.app.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebooklibrary.app.common.SearchVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;
	
	public static final String DEFAULTIMAGE="defaultimage.jpg";
	
	public int register(MemberVO vo){
		return memberDao.register(vo);
	}
	
	public int logincheck(MemberVO vo){
		String dbPwd=memberDao.logincheck(vo);
		int result=0;
		if(vo.getPwd().equals(dbPwd)){
			result=LOGIN_OK;
		}else if(dbPwd==null || dbPwd.isEmpty()){
			result=ID_NONE;
		}else{
			result=PWD_DISAGREE;
		}
		return result;
	}
	public MemberVO selectByUserName(String userName){
		return memberDao.selectByUserName(userName);
	}
	public List<MemberVO> selectMemberAll(SearchVO vo){
		return memberDao.selectMemberAll(vo);
	}
	public int selectMemberCount(SearchVO vo){
		return memberDao.selectMemberCount(vo);
	}
	public int selectMemberCheckId(String userId){
		return memberDao.selectMemberCheckId(userId);
	}

	@Override
	public int updateBackImg(MemberVO vo) {
		return memberDao.updateBackImg(vo);
	}

	@Override
	public String selectBymemberVo(MemberVO vo) {
		return memberDao.selectBymemberVo(vo);
	}

	@Override
	public int updateTempPwd(MemberVO vo) {
		return memberDao.updateTempPwd(vo);
	}

	@Override
	public int updateUserInfo(MemberVO vo) {
		return memberDao.updateUserInfo(vo);
	}

	@Override
	public int updateCash(Map<String, Object> map) {
		return memberDao.updateCash(map);
	}

	@Override
	public int outMember(String userId) {
		return memberDao.outMember(userId);
	}

	
	
	
}
