package com.ebooklibrary.app.library.qna.controller;

import java.util.List;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		logger.info("Qna 리스트 ");
		
		List<QnaBoardVO> alist=qnaBoardService.selectQnaAll();
		logger.info("결과처리값 alist={}",alist);
		
		model.addAttribute("qnaList",alist);
		
		return "library/qna/list";
	}
	
	@RequestMapping(value="/qnaWrite.do", method=RequestMethod.GET)
	public String QnaBoardWrite_get(){
		
		logger.info("Qna 글쓰기폼");
		return	"library/qna/qnawrite";
	}
	
	@RequestMapping(value="/qnaWrite.do", method=RequestMethod.POST)
	public String QnaBoardWrite_post(@ModelAttribute QnaBoardVO qnaBoardVo,Model model){
		logger.info("Qna 글쓰기 처리페이지, 입력값 qnaBoardVo={} ", qnaBoardVo);
		
		int cnt = qnaBoardService.insertQnaBoard(qnaBoardVo);
		
		
		String msg="",url="/library/qna/qnaWrite.do";
		
		if(cnt>0){
			msg="글작성 성공";
			url="/library/qna/qnaDetail.do";
		}else{
			msg="글 작성 실패";
			
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/qnaDetail.do") 
	public String QnaBoardDetail(@RequestParam int QnaNo,Model model){
		logger.info("디테일 페이지 접속 입력값  QnaNo={}", QnaNo);
		
		QnaBoardVO qnaBoardVo = qnaBoardService.selectByNo(QnaNo);
		
		logger.info("결과값은 qnaBoardVo={}",qnaBoardVo);
		
		model.addAttribute("qnaBoardVo",qnaBoardVo);
		
		return "library/qna/qnaDetail";
		
	}
	
	/*@RequestMapping(value="/qnaEdit.do",method=RequestMethod.GET)
	public String QnaBaordEdit(@RequestParam int QnaNo){
		logger.info("수정 페이지 접속 파라미터 입력값 Qna");
	}*/
	
	
	
	
	
	
	
}
