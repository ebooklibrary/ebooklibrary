package com.ebooklibrary.app.library.ServiceCenter.Faq.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebooklibrary.app.common.SearchVO;

@Service
public class FaqServiceImpl implements FaqService{
	private static final Logger logger
	=LoggerFactory.getLogger(FaqServiceImpl.class);
	
	@Autowired
	private FaqDAO faqDao;

	@Override
	public int insertFaqBoard(FaqVO faqVo) {
		return faqDao.insertFaqBoard(faqVo);
	}

	@Override
	public List<FaqVO> selectFaqAll(SearchVO searchVo) {
		return faqDao.selectFaqAll(searchVo);
	}

	@Override
	public int selectListCount(SearchVO searchVo) {
		return faqDao.selectListCount(searchVo);
	}

	@Override
	public int readCountAdd(int faqNo) {
		return faqDao.readCountAdd(faqNo);
	}

	@Override
	public int faqEdit(FaqVO faqVo) {
		return faqDao.faqEdit(faqVo);
	}

	@Override
	public int faqDelete(int faqNo) {
		return faqDao.faqDelete(faqNo);
	}

	@Override
	public FaqVO selectByNo(int faqNo) {
		return faqDao.selectByNo(faqNo);
	}

	@Override
	public List<FaqVO> fixedList() {
		return faqDao.fixedList();
	}

	@Override
	public int fixedByNo(int faqNo) {
		return faqDao.fixedByNo(faqNo);
	}
	
	
		
}
