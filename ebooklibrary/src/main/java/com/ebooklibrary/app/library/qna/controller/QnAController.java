package com.ebooklibrary.app.library.qna.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ebooklibrary.app.library.qna.model.QnaBoardService;
import com.ebooklibrary.app.library.qna.model.QnaBoardVO;

@Controller
@RequestMapping("/library/qna")
public class QnAController {
	private static final Logger logger
	= LoggerFactory.getLogger(QnAController.class);
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@RequestMapping("/list.do")
	public String listQnaBoard(Model model){
		
		logger.info("Qna 글목록 조회");
		
		List<QnaBoardVO> alist=qnaBoardService.selectQnaAll();
		logger.info("결과값 alist={}",alist);
		
		model.addAttribute("qnaList",alist);
		
		return "library/qna/list";
	}
	
	@RequestMapping(value="/write.do")
	public int insertQnaBoard(){
		logger.info("Qna 글작성페이지");
		
		return 0;
		
	}
}
