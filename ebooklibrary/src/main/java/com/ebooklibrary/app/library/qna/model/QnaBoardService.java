package com.ebooklibrary.app.library.qna.model;

import java.util.List;

import com.ebooklibrary.app.common.MemberSearchVO;
import com.ebooklibrary.app.common.SearchVO;

public interface QnaBoardService {
	//list
	public List<QnaBoardVO> selectQnaAll(SearchVO searchVo);
	public int selectListCount(SearchVO searchVo);
	//insert
	public int insertQnaBoard(QnaBoardVO qnaBoardVo);
	//insert->detail
	public int selectQnaBoardByUsername(String userName);
	//detail
	public QnaBoardVO selectByNo(int QnaNo) ;
	//edit
	public int qnaBoardEdit(QnaBoardVO qnaBoardVo);
	//delete
	public int qnaBoardDelete(int qnaNo);
	//readCount
	public int readCountAdd(int qnaNo);
	
	//prePage
	public int prePageMove(int qnaNo);
	//nextPage
	public int nextPageMove(int qnaNo);
	//MaxqnaNo
	public int maxQnaNo();
	//MinqnaNo
	public int minQnaNo();
	//user'sWriting//멤버번호로 조회할예정 일단 유저네임으로.
	public List<QnaBoardVO> selectByMemberNo(MemberSearchVO memVo);
	public int selectCountByMemNo(MemberSearchVO memVo);
	
}
