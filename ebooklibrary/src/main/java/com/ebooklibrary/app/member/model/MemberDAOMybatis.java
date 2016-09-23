package com.ebooklibrary.app.member.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.ebooklibrary.app.common.SearchVO;

@Repository
public class MemberDAOMybatis extends SqlSessionDaoSupport implements MemberDAO {
	private String namespace="com.mybatis.mapper.oracle.member";
	
	public int register(MemberVO vo){
		return getSqlSession().insert(namespace+".inserMember", vo);
	}
	
	public String logincheck(MemberVO vo){
		return getSqlSession().selectOne(namespace+".selectMemberByMemberVo", vo);
	}
	
	public MemberVO selectByUserName(String userName){
		return getSqlSession().selectOne(namespace+".selectMemberByUserName", userName);
	}
	public List<MemberVO> selectMemberAll(SearchVO vo){
		return getSqlSession().selectList(namespace+".selectMemberAll", vo);
	}
	public int selectMemberCount(SearchVO vo){
		return getSqlSession().selectOne(namespace+".selectMemberCount", vo);
	}
	
	public int selectMemberCheckId(String userId){
		return getSqlSession().selectOne(namespace+".selectCountUserid", userId);
	}

	@Override
	public int updateBackImg(MemberVO vo) {
		return getSqlSession().update(namespace+".updateBackImg", vo);
	}

	@Override
	public String selectBymemberVo(MemberVO vo) {
		return getSqlSession().selectOne(namespace+".selectMemberBymemberVo", vo);
	}

	@Override
	public int updateTempPwd(MemberVO vo) {
		return getSqlSession().update(namespace+".updateTempPwd", vo);
	}

	@Override
	public int updateUserInfo(MemberVO vo) {
		return getSqlSession().update(namespace+".updateUserInfo", vo);
	}

	@Override
	public int updateCash(Map<String, Object> map) {
		return getSqlSession().update(namespace+".updateCash",map);
	}

	@Override
	public int outMember(String userId) {
		return getSqlSession().update(namespace+".outMember", userId);
	}

	
}
