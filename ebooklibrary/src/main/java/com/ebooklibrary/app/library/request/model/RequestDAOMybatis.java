package com.ebooklibrary.app.library.request.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ebooklibrary.app.common.SearchVO;
import com.ebooklibrary.app.library.notice.model.NoticeDaoMybatis;
import com.ebooklibrary.app.library.notice.model.NoticeVO;

@Repository
public class RequestDAOMybatis extends SqlSessionDaoSupport implements RequestDAO{
private static final Logger logger = LoggerFactory.getLogger(NoticeDaoMybatis.class);
	
	private String NAMESPACE = "com.mybatis.mapper.oracle.request";
	
	
	public int insertRequest(RequestVO vo){
		//공지사항 등록
		int cnt = getSqlSession().insert(NAMESPACE+".insertRequest",vo);
		return cnt;
	}
	@Override
	public RequestVO selectByNoRequest(int requestNo) {
		return getSqlSession().selectOne(NAMESPACE+".seletctByNoRequest", requestNo);
	}
	@Override
	public int editRequest(RequestVO vo) {
		return getSqlSession().update(NAMESPACE+".editRequest",vo);
	}
	@Override
	public int deleteRequest(int requestNo) {
		return getSqlSession().delete(NAMESPACE+".deleteRequest",requestNo);
	}
	@Override
	public List<RequestVO> selectAllRequest(SearchVO searchVo) {
		//공지사항 전체보기
		return getSqlSession().selectList(NAMESPACE+".selectAllRequest",searchVo);
	}
	@Override
	public int requestCount(SearchVO searchVo) {
		return getSqlSession().selectOne(NAMESPACE+".selectRequestCount",searchVo);
	}
}
