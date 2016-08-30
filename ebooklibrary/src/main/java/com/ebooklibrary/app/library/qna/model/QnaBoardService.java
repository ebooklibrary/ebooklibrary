package com.ebooklibrary.app.library.qna.model;

import java.util.List;

public interface QnaBoardService {
	public List<QnaBoardVO> selectQnaAll();
	public int insertQnaBoard(QnaBoardVO qnaBoardVo);
	public QnaBoardVO selectByNo(int QnaNo) ;
	
	public int selectQnaBoardByUsername(String username);
	
	public int qnaBoardEdit(QnaBoardVO qnaBoardVo);
}
