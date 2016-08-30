package com.ebooklibrary.app.library.qna.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class QnaBoardDAOMybatis extends SqlSessionDaoSupport implements QnaBoardDAO {
	
	private String namespace="config.mybatis.mapper.oracle.qnaboard";
	
	@Override
	public List<QnaBoardVO> selectQnaAll() {
		return getSqlSession().selectList(namespace+".selectQnaAll");
	}

	@Override
	public int insertQnaBoard(QnaBoardVO qnaBoardVo) {
		return getSqlSession().insert(namespace+".insertQnaBoard", qnaBoardVo);
	}

	@Override
	public int selectQnaBoardByUsername(String writer) {
		return getSqlSession().selectOne(namespace+".selectBoardNoByUsername",writer);
		
	}
	@Override
	public QnaBoardVO selectByNo(int qnaNo) {
		return getSqlSession().selectOne(namespace+".selectByNo",qnaNo);
	}


	@Override
	public int qnaBoardEdit(QnaBoardVO qnaBoardVo) {
		return getSqlSession().update(namespace+".update_no",qnaBoardVo);
	}
	
	
}
