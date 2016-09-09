package com.ebooklibrary.app.library.qna.comments.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ebooklibrary.app.common.MemberSearchVO;

@Service
public class QnaCommentServiceImpl implements QnaCommentService {
	private static final Logger logger
	=LoggerFactory.getLogger(QnaCommentService.class);
	
	@Autowired
	private QnaCommentDAO qnaCommentDao;

	@Override
	public int insertQnaComment(QnaCommentVO qcVo) {
		return qnaCommentDao.insertQnaComment(qcVo);
	}

	@Override
	public List<QnaCommentVO> selectAllQnaComment(int qnaNo) {
		return qnaCommentDao.selectAllQnaComment(qnaNo);
	}

	@Override
	@Transactional
	public int insertQnaReComment(QnaCommentVO qcVo) {
		int cnt=0;
		cnt = qnaCommentDao.updateSortNo(qcVo);
		System.out.println(qcVo);
		logger.info("sortUpdate 처리 결과값 cnt={}",cnt);
		cnt = qnaCommentDao.insertQnaReComment(qcVo);
		logger.info("insertRecomment 처리 결과값 cnt={}",cnt);
		return cnt;
	}

	@Override
	public int countQnaComment(int qnaNo) {
		
		
		return qnaCommentDao.countQnaComment(qnaNo);
	}

	@Override
	public int selectedComment(int commentNo) {
		return qnaCommentDao.selectedComment(commentNo);
	}
	
	
}
