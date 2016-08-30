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
			int qnaBoardNo=qnaBoardService.selectQnaBoardByUsername(qnaBoardVo.getWriter());
			logger.info("마지막 글번호 추출  qnaBoardNo={}",qnaBoardNo);
			
			url="/library/qna/qnaDetail.do?qnaNo="+qnaBoardNo;
		}else{
			msg="글 작성 실패";
			
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/qnaDetail.do") 
	public String QnaBoardDetail(@RequestParam(defaultValue="0") int qnaNo,Model model){
		logger.info("디테일 페이지 접속 입력값  QnaNo={}", qnaNo);
		
		QnaBoardVO qnaBoardVo = qnaBoardService.selectByNo(qnaNo);
		
		logger.info("결과값은 qnaBoardVo={}",qnaBoardVo);
		
		model.addAttribute("qnaBoardVo",qnaBoardVo);
		
		return "library/qna/qnaDetail";
		
	}
	
	@RequestMapping(value="/qnaEdit.do",method=RequestMethod.GET)
	public String QnaBoardEdit(@RequestParam(defaultValue="0") int qnaNo,Model model){
		logger.info("수정 페이지 접속 파라미터 입력값 qnaNo={}",qnaNo);
		
		QnaBoardVO qnaBoardVo = qnaBoardService.selectByNo(qnaNo);
		
		logger.info("수정페이지 입력 파라미터값 qnaBoardVo={}",qnaBoardVo);
		
		model.addAttribute("qnaBoardVo",qnaBoardVo);
		
		
		return "library/qna/qnaEdit";
	}
	
	@RequestMapping(value="/qnaEdit.do",method=RequestMethod.POST)
	public String QnaBoardEdit(
			@ModelAttribute QnaBoardVO qnaBoardVo,
			Model model){
		
		//1.
		logger.info("수정 페이지 수정처리 파라미터 qnaBoardVo={}",qnaBoardVo);
		
		//2.
		int cnt = qnaBoardService.qnaBoardEdit(qnaBoardVo);
		logger.info("결과값 cnt={}",cnt);
		
		String msg="",url="/library/qna/qnaEdit.do?qnaNo="+qnaBoardVo.getQnaNo();
		if(cnt>0){
			msg="글 수정 성공";
			url="/library/qna/qnaDetail.do?qnaNo="+qnaBoardVo.getQnaNo();
		}else{
			msg="글 수정 실패";
		}
		
		
		//3.
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	
	
	
	
	
	
	
	
}
