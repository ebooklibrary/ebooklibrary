package com.ebooklibrary.app.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDao;
	
	public int register(MemberVO vo){
		return memberDao.register(vo);
	}
	
	public int logincheck(String userName,String pwd){
		String dbPwd=memberDao.logincheck(userName);
		int result=0;
		if(pwd.equals(dbPwd)){
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
}
