package com.ebooklibrary.app.library.qna.comments.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ebooklibrary.app.library.qna.comments.model.QnaCommentService;
import com.ebooklibrary.app.library.qna.comments.model.QnaCommentVO;

@Controller
public class QnaCommentController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(QnaCommentController.class);
	
	@Autowired
	private QnaCommentService qnaCommentsService;
	
	
	@RequestMapping("/comments/commentList.do")
	public String listQnaComment(@RequestParam int qnaNo,Model model){
		logger.info("코멘트 list 페이지 파라미터값 qnaNo={}",qnaNo);

		//1.
		List<QnaCommentVO> alist = qnaCommentsService.selectAllQnaComment();
		
		
		//2.
		
		
		//3.
		
		
		return "";
	}
	
	
	@RequestMapping("/comments/commentWrite.do")
	public String writeQnaComment(@ModelAttribute QnaCommentVO qnaCommentVo){
		
		return "";
	}
}
