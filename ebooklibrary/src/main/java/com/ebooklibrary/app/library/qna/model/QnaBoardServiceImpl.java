package com.ebooklibrary.app.library.qna.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ebooklibrary.app.common.MemberSearchVO;
import com.ebooklibrary.app.common.SearchVO;
import com.ebooklibrary.app.library.qna.comments.model.QnaCommentService;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	private static Logger logger
	= LoggerFactory.getLogger(QnaBoardServiceImpl.class);
	
	@Autowired
	private QnaBoardDAO qnaBoardDao;
	
	@Autowired
	private QnaCommentService qnaCommentService;
	

	@Override
	public int insertQnaBoard(QnaBoardVO qnaBoardVo) {
		
		return qnaBoardDao.insertQnaBoard(qnaBoardVo);
	}

	@Override
	public QnaBoardVO selectByNo(int QnaNo) {
		return qnaBoardDao.selectByNo(QnaNo);
	}

	@Override
	public int selectQnaBoardByMemberNo(int memberNo) {
		return qnaBoardDao.selectQnaBoardByMemberNo(memberNo);
	}

	@Override
	public int qnaBoardEdit(QnaBoardVO qnaBoardVo) {
		return qnaBoardDao.qnaBoardEdit(qnaBoardVo);
	}

	@Override
	public int qnaBoardDelete(int qnaNo) {
		return qnaBoardDao.qnaBoardDelete(qnaNo);
	}

	@Override
	public int selectListCount(MemberSearchVO searchVo) {
		return qnaBoardDao.selectListCount(searchVo);
	}

	@Override
	@Transactional
	public List<QnaBoardVO> selectQnaAll(MemberSearchVO searchVo) {
		List<QnaBoardVO> alist= qnaBoardDao.selectQnaAll(searchVo);
		logger.info("selectQnaAll 처리값 alist.size()={}",alist.size());
		
		for(int i =0;i<alist.size() ;i++){
			int qnaNo=alist.get(i).getQnaNo();
			alist.get(i).setCommentCount(qnaCommentService.countQnaComment(qnaNo));
			logger.info("selectQnaAll 입력값 qnaNo={}",qnaNo);
		}
		
		return alist;
	}

	@Override
	public int readCountAdd(int qnaNo) {
		return qnaBoardDao.readCountAdd(qnaNo);
	}

	@Override
	public int prePageMove(int qnaNo) {
		return qnaBoardDao.prePageMove(qnaNo);
	}

	@Override
	public int nextPageMove(int qnaNo) {
		return qnaBoardDao.nextPageMove(qnaNo);
	}

	@Override
	public int maxQnaNo() {
		
		return qnaBoardDao.maxQnaNo();
	}

	@Override
	public int minQnaNo() {
		return qnaBoardDao.minQnaNo();
	}

	@Override
	public List<QnaBoardVO> selectByMemberNo(MemberSearchVO memberSVo) {
		return qnaBoardDao.selectByMemberNo(memberSVo);
	}

	@Override
	public int selectCountByMemNo(MemberSearchVO memberSVo) {
		return qnaBoardDao.selectCountByMemNo(memberSVo);
	}

	@Override
	@Transactional
	public int completeQna(int qnaNo,int commentNo) {
		int cnt =qnaBoardDao.completeQna(qnaNo);
		logger.info("답변완료 처리값 cnt={}",cnt);
		
		cnt= qnaCommentService.selectedComment(commentNo);
		logger.info("답변완료 처리값 cnt={}",cnt);
		
		return cnt;
	}

	
	
	
}
