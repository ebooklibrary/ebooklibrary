package com.ebooklibrary.app.library.ServiceCenter.Faq.model;

import java.util.List;

import com.ebooklibrary.app.common.SearchVO;

public interface FaqDAO {
	//list
	public List<FaqVO> selectFaqAll(SearchVO searchVo);
	public int selectListCount(SearchVO searchVo);
	//insert
	public int insertFaqBoard(FaqVO faqVo);
	//readCount
	public int readCountAdd(int faqNo);
	//detail
	public FaqVO selectByNo(int faqNo);
	//edit
	public int faqEdit(FaqVO faqVo);
	//delete
	public int faqDelete(int faqNo);
	
	//fixed
	public List<FaqVO> fixedList();
	
	//fixByNo
	public int fixedByNo(int faqNo);
}
