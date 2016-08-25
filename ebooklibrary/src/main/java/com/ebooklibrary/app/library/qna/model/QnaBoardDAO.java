package com.ebooklibrary.app.library.qna.model;

import java.util.List;

public interface QnaBoardDAO {
	public List<QnaBoardVO> selectQnaAll();
	public int insertQnaBoard(QnaBoardVO qnaBoardVo);
}
