package com.ebooklibrary.app.library.qna.comments.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaCommentServiceImpl implements QnaCommentService {
	
	@Autowired
	private QnaCommentDAO qnaCommentDao;

	@Override
	public int insertQnaComment(QnaCommentVO qcVo) {
		return qnaCommentDao.insertQnaComment(qcVo);
	}

	@Override
	public List<QnaCommentVO> selectAllQnaComment() {
		return qnaCommentDao.selectAllQnaComment();
	}
	
	
}
