package com.ebooklibrary.app.library.ServiceCenter.Faq.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDaoMybatis extends SqlSessionDaoSupport implements FaqDAO {

	private String namespace="config.mybatis.mapper.oracle.faq";
	
	@Override
	public int insertFaqBoard(FaqVO faqVo) {
		return getSqlSession().insert(namespace+".faqinsert",faqVo);
	}
	
}
