package com.ebooklibrary.app.library.qna.comments.model;

import java.util.List;

public interface QnaCommentDAO {
	public int insertQnaComment(QnaCommentVO qcVo);
	public List<QnaCommentVO> selectAllQnaComment();
	
	
}
