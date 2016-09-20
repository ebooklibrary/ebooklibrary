package com.ebooklibrary.app.library.qna.comments.model;

import java.util.List;

import com.ebooklibrary.app.common.MemberSearchVO;

public interface QnaCommentDAO {
	public int insertQnaComment(QnaCommentVO qcVo);
	public int maxSortNo(QnaCommentVO qcVo);
	
	public List<QnaCommentVO> selectAllQnaComment(int qnaNo);
	public int updateSortNo(QnaCommentVO qcVo);
	public int insertQnaReComment(QnaCommentVO qcVo);
	public int countQnaComment(int qnaNo);
	public int selectedComment(int commentNo);
	
	//코멘트 수정
	public int updateComment(QnaCommentVO qcVo);
	
	//코멘트 삭제
	public int deleteComment(int commentNo);
	public int deleteGroupNo(int cmtGroupNo);
	public int countCmtGroupNo(int cmtGroupNo);
	public int countCmtGroupNoY(int cmtGroupNo);
	public int holdingDeleteCmt(int commentNo);
	
}
