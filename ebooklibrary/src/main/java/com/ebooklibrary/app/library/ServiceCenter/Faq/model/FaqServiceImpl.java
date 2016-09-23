package com.ebooklibrary.app.library.ServiceCenter.Faq.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
		
}
