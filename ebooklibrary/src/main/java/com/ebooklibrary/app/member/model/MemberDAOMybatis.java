package com.ebooklibrary.app.member.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis extends SqlSessionDaoSupport implements MemberDAO {
	private String namespace="com.mybatis.mapper.oracle.member";
	
	public int register(MemberVO vo){
		return getSqlSession().insert(namespace+".inserMember", vo);
	}
	
}
