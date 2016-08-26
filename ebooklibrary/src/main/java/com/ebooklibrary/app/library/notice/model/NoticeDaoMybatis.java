package com.ebooklibrary.app.library.notice.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDaoMybatis extends SqlSessionDaoSupport implements NoticeDAO{
	private static final Logger logger = LoggerFactory.getLogger(NoticeDaoMybatis.class);
	
	private String NAMESPACE = "com.mybatis.mapper.oracle.ebooklibraryNotice";
	
	
	public int insertNotice(NoticeVO noticeVo){
		//공지사항 등록
		int cnt = getSqlSession().insert(NAMESPACE+".insertNotice",noticeVo);
		return cnt;
	}
/*	public List<NoticeVO> selectAllNotice(NoticeVO noticeVo){
		//공지사항 전체 보기
	}*/
}
