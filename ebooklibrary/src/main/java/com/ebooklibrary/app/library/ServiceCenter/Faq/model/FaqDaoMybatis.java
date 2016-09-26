package com.ebooklibrary.app.library.ServiceCenter.Faq.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.ebooklibrary.app.common.SearchVO;

@Repository
public class FaqDaoMybatis extends SqlSessionDaoSupport implements FaqDAO {

	private String namespace="config.mybatis.mapper.oracle.faq";
	
	@Override
	public int insertFaqBoard(FaqVO faqVo) {
		return getSqlSession().insert(namespace+".faqinsert",faqVo);
	}

	@Override
	public List<FaqVO> selectFaqAll(SearchVO searchVo) {
		
		return getSqlSession().selectList(namespace+".selectQnaAll", searchVo);
	}

	@Override
	public int selectListCount(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalCount",searchVo);
				
	}

	@Override
	public int readCountAdd(int faqNo) {
		return getSqlSession().update(namespace+".readCountAdd",faqNo);
	}

	@Override
	public int faqEdit(FaqVO faqVo) {
		return getSqlSession().update(namespace+".update_no",faqVo);
	}

	@Override
	public int faqDelete(int faqNo) {
		return getSqlSession().delete(namespace+".deletebyFaqNo",faqNo);
	}

	@Override
	public FaqVO selectByNo(int faqNo) {
		return getSqlSession().selectOne(namespace+".selectByNo",faqNo);
	}

	@Override
	public List<FaqVO> fixedList() {
		return getSqlSession().selectList(namespace+".fixedFAQ");
	}

	@Override
	public int fixedByNo(int faqNo) {
		return getSqlSession().update(namespace+".fixByNo",faqNo);
	}
	
}
