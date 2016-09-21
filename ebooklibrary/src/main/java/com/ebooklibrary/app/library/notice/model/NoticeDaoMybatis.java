package com.ebooklibrary.app.library.notice.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ebooklibrary.app.common.SearchVO;

@Repository
public class NoticeDaoMybatis extends SqlSessionDaoSupport implements NoticeDAO{
	private static final Logger logger = LoggerFactory.getLogger(NoticeDaoMybatis.class);
	
	private String NAMESPACE = "com.mybatis.mapper.oracle.ebooklibraryNotice";
	
	
	public int insertNotice(NoticeVO noticeVo){
		//공지사항 등록
		int cnt = getSqlSession().insert(NAMESPACE+".insertNotice",noticeVo);
		return cnt;
	}
	


	@Override
	public NoticeVO selectByNoNotice(int notice_No) {
		return getSqlSession().selectOne(NAMESPACE+".seletctByNoNotice", notice_No);
	}


	@Override
	public int editNotice(NoticeVO noticeVo) {
		return getSqlSession().update(NAMESPACE+".editNotice",noticeVo);
	}


	@Override
	public int deleteNotice(NoticeVO noticeVo) {
		return getSqlSession().delete(NAMESPACE+".deleteNotice",noticeVo);
	}



	@Override
	public List<NoticeVO> selectAllNotice(SearchVO searchVo) {
		//공지사항 전체보기
		return getSqlSession().selectList(NAMESPACE+".selectAllNotice",searchVo);
	}



	@Override
	public int noticeCount(SearchVO searchVo) {
		return getSqlSession().selectOne(NAMESPACE+".selectCount",searchVo);
	}



	@Override
	public int readCountAdd(int notice_No) {
		return getSqlSession().update(NAMESPACE+".readCountAdd",notice_No);
	}



	@Override
	public int prePageNotice(int notice_No) {
		Integer result= getSqlSession().selectOne(NAMESPACE+".prePage",notice_No);
		if(result==null){
			result=0;
		}
		return result;
	}



	@Override
	public int minPage() {
		return getSqlSession().selectOne(NAMESPACE+".minPage");
	}



	@Override
	public int nextPageNotice(int notice_No) {
		Integer  result = getSqlSession().selectOne(NAMESPACE+".nextPage",notice_No);
		if(result==null){
			result=0;
		}
		return result;
	}



	@Override
	public int nextPage() {
		return getSqlSession().selectOne(NAMESPACE+".maxPage");
	}



	@Override
	public List<NoticeVO> selectMainNotice() {
		return getSqlSession().selectList(NAMESPACE+".selectMainNotice");
	}



	@Override
	public List<NoticeVO> selectServiceCenterNotice() {
		return getSqlSession().selectList(NAMESPACE+".selectServiceNotice");
	}
}
