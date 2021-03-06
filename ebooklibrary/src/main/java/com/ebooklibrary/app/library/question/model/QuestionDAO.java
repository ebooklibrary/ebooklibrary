package com.ebooklibrary.app.library.question.model;

import java.util.List;

public interface QuestionDAO {
	public int insertQuestion(QuestionVO questionVo);
	public List<QuestionVO> selectByMemberNo(int memberNo);
	public int updateQuestion(QuestionVO questionVo);
}
