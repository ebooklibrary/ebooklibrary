package com.ebooklibrary.app.library.qna.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	 
	@Autowired
	private QnaBoardDAO qnaBoardDao;

	@Override
	public List<QnaBoardVO> selectQnaAll() {
		
		return qnaBoardDao.selectQnaAll();
	}
	
	
}
