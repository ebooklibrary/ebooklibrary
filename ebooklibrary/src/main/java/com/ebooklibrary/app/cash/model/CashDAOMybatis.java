package com.ebooklibrary.app.cash.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.ebooklibrary.app.member.model.MemberVO;

@Repository
public class CashDAOMybatis extends SqlSessionDaoSupport implements CashDAO{
	private String namespace="com.mybatis.mapper.oracle.cash";
	
	@Override
	public int updateCash(MemberVO vo) {
		return getSqlSession().update(namespace+".updateCash", vo);
	}

	@Override
	public int updateMinusCash(MemberVO vo) {
		return getSqlSession().update(namespace+".updateMinusCash", vo);
	}

	@Override
	public int insertCashCharge(CashVO vo) {
		return getSqlSession().update(namespace+".insertCashCharge", vo);
	}
}
