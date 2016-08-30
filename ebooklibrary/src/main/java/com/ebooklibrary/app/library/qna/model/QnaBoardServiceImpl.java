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

	@Override
	public int insertQnaBoard(QnaBoardVO qnaBoardVo) {
		
		return qnaBoardDao.insertQnaBoard(qnaBoardVo);
	}

	@Override
	public QnaBoardVO selectByNo(int QnaNo) {
		return qnaBoardDao.selectByNo(QnaNo);
	}

	@Override
	public int selectQnaBoardByUsername(String username) {
		return qnaBoardDao.selectQnaBoardByUsername(username);
	}

	@Override
	public int qnaBoardEdit(QnaBoardVO qnaBoardVo) {
		return qnaBoardDao.qnaBoardEdit(qnaBoardVo);
	}

	
	
	
}
