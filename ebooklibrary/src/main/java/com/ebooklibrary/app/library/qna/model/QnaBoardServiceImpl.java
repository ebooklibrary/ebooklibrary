package com.ebooklibrary.app.library.qna.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebooklibrary.app.common.MemberSearchVO;
import com.ebooklibrary.app.common.SearchVO;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	 
	@Autowired
	private QnaBoardDAO qnaBoardDao;

	

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
	public List<QnaBoardVO> selectQnaAll(MemberSearchVO searchVo) {
		
		return qnaBoardDao.selectQnaAll(searchVo);
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
	public int completeQna(int qnaNo) {
		return qnaBoardDao.completeQna(qnaNo);
	}

	
	
	
}
