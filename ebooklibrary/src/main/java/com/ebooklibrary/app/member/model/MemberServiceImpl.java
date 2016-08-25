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
}
