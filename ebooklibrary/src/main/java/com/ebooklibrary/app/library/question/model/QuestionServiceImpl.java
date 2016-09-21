package com.ebooklibrary.app.library.question.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDAO questionDao;

	@Override
	public int insertQuestion(QuestionVO questionVo) {
		return questionDao.insertQuestion(questionVo);
	}

	@Override
	public List<QuestionVO> selectByMemberNo(int memberNo) {
		return questionDao.selectByMemberNo(memberNo);
	}
}
