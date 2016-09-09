package com.ebooklibrary.app.library.qna.comments.model;

import java.util.List;

import com.ebooklibrary.app.common.MemberSearchVO;

public interface QnaCommentService {
	public int insertQnaComment(QnaCommentVO qcVo);
	public List<QnaCommentVO> selectAllQnaComment(int qnaNo);
	public int insertQnaReComment(QnaCommentVO qcVo);
	public int countQnaComment(int qnaNo);
	public int selectedComment(int commentNo);
}
