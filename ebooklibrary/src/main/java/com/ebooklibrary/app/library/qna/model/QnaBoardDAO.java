package com.ebooklibrary.app.library.qna.model;

import java.util.List;

public interface QnaBoardDAO {
	//list
	public List<QnaBoardVO> selectQnaAll();
	//insert
	public int insertQnaBoard(QnaBoardVO qnaBoardVo);
	//insert->detail
	public int selectQnaBoardByUsername(String writer);
	
	//detail
	public QnaBoardVO selectByNo(int qnaNo);
	
	//edit
	public int qnaBoardEdit(QnaBoardVO qnaBoardVo);
	
}
