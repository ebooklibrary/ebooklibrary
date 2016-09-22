package com.ebooklibrary.app.library.question.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDaoMyBatis  extends SqlSessionDaoSupport implements QuestionDAO{

	private String NAMESPACE ="config.mybatis.mapper.oracle.question";
	
	@Override
	public int insertQuestion(QuestionVO questionVo) {
		return getSqlSession().insert(NAMESPACE+".insertQuestion",questionVo);
	}

	@Override
	public List<QuestionVO> selectByMemberNo(int memberNo) {
		return getSqlSession().selectList(NAMESPACE+".selectByMemberNo",memberNo);
	}

	@Override
	public int updateQuestion(QuestionVO questionVo) {
		return getSqlSession().update(NAMESPACE+".updateAdmin",questionVo);
	}


	
}
