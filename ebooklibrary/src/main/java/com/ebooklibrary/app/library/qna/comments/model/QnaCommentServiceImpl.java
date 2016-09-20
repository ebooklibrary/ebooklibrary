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
		
		int sortNo=qnaCommentDao.maxSortNo(qcVo);
		logger.info("maxSortNo 처리 결과값 cnt={}",cnt);
		
		if(qcVo.getSortNo()<sortNo){
			qcVo.setSortNo(sortNo+1);
			logger.info("maxSortNo 처리 결과값 sortNo={},qcVo.getSortNo()={}",sortNo,qcVo.getSortNo());
			
		}else{
			cnt = qnaCommentDao.updateSortNo(qcVo);
			logger.info("sortUpdate 처리 결과값 cnt={}",cnt);
			System.out.println(qcVo);
			
		}
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

	@Override
	public int updateComment(QnaCommentVO qcVo) {
		return qnaCommentDao.updateComment(qcVo);
	}

	@Override
	public int deleteComment(QnaCommentVO qcVo) {
		int cnt=0;
		logger.info("입력값 qcVo.getCommentNo()={}",qcVo.getCommentNo());
		logger.info("입력값 qcVo.getCmtGroupNo()={}",qcVo.getCmtGroupNo());
		
		int count= qnaCommentDao.countCmtGroupNo(qcVo.getCmtGroupNo());
		logger.info("countCmtGno처리값 count={}",count);
		
		if(count<2){
			cnt = qnaCommentDao.deleteComment(qcVo.getCommentNo());
			logger.info("삭제 처리 결과 cnt={}",cnt);
			
			
		}else{
			cnt = qnaCommentDao.holdingDeleteCmt(qcVo.getCommentNo());
			logger.info("삭제보류 처리 결과 cnt={}",cnt);
			
			int count2= qnaCommentDao.countCmtGroupNoY(qcVo.getCmtGroupNo());
			logger.info("삭제후 countCmtGno처리값 count2={}",count2);
			
			if(count==count2){
				cnt = qnaCommentDao.deleteGroupNo(qcVo.getCmtGroupNo());
				logger.info("전체 삭제 처리 결과 cnt={}",cnt);
			}
		}
		
		return cnt;
	}
	
	
	
}
