package com.ebooklibrary.app.library.qna.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
		return getSqlSession().insert(namespace+".", qnaBoardVo);
	}
	
	
}
