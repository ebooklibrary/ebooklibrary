package com.ebooklibrary.app.library.qna.comments.model;

import java.util.List;

public interface QnaCommentService {
	public int insertQnaComment(QnaCommentVO qcVo);
	public List<QnaCommentVO> selectAllQnaComment(int qnaNo);
	public int insertQnaReComment(QnaCommentVO qcVo);
}
