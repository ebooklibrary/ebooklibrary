package com.ebooklibrary.app.library.question.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ebooklibrary.app.library.question.model.QuestionService;
import com.ebooklibrary.app.library.question.model.QuestionVO;
import com.ebooklibrary.app.library.stiemap.controller.SiteMapController;
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;

@Controller
@RequestMapping("/library/serviceCenter")
public class QuestionController {
	
	@Autowired
	private QuestionService questionservice;
	
	@Autowired
	private MemberService memberservice;
	
	public static final Logger logger = LoggerFactory.getLogger(SiteMapController.class);
	
	@RequestMapping(value ="/question.do", method = RequestMethod.GET)
	public String question_get(@RequestParam String userId, Model model){
		logger.info("1:1문의 보여주기");
		MemberVO memberVo;
		
		memberVo = memberservice.selectByUserName(userId);
		
		model.addAttribute("memberVo", memberVo);
		
		return "library/serviceCenter/question";
	}
	
	
	@RequestMapping(value ="/questionWrite.do",method=RequestMethod.GET)
	public String questionWrite_get(){
		logger.info("1:1문의 글쓰기 화면 보여주기");
				
		return "library/serviceCenter/questionWrite";
		
	}
	
	@RequestMapping(value="/questionWrite.do", method= RequestMethod.POST)
	public String questionWrite_post(@ModelAttribute QuestionVO questionVo ,Model model ){
		logger.info("1:1 문의 글쓰기 처리");
		
		int cnt = questionservice.insertQuestion(questionVo);
		
		logger.info("글쓰기 결과 cnt ={}"+cnt);
		String msg ="" , url ="/library/serviceCenter/questionWrite.do";
		
		if(cnt>0){
			msg="1:1 문의 작성 성공";
			url ="/library/serviceCenter/myQuestion.do";
		}
		else{
			msg="1:1문의 작성 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/myQuestion.do")
	public String AllQuestion(HttpSession session,
			Model model){
		
		int memberNo = (Integer)session.getAttribute("memberNo");
		logger.info("자기가 문의한글 보기");
		logger.info("파라미터 조회 결과 memberNo = {}"+memberNo);
		
		List<QuestionVO> alist = questionservice.selectByMemberNo(memberNo);
		
		model.addAttribute("alist", alist);
		
		return "library/serviceCenter/myQuestion";
	}
	
	@RequestMapping(value="/updateQuestion.do" , method=RequestMethod.GET)
	public String GetUpdateAdmin(){
		logger.info("관리자용 답변 업데이트 화면 보여주기");
		
		return "library/serviceCenter/updateQuestion";
	}
	
	@RequestMapping(value ="/updateQuestion.do" , method=RequestMethod.POST)
	public String PostUpdateAdmin(@ModelAttribute QuestionVO questionVo , Model model){
		logger.info("관리자용 답변 업데이트 처리하기");
		
		logger.info("파라미터 questionVo ={}"+questionVo);
		int cnt = questionservice.updateQuestion(questionVo);
		
		String msg = "" , url = "/library/serviceCenter/updateQuestion";
		if(cnt>0){
			msg="1:1문의 답변달기 성공";
			url="/library/serviceCenter/libraryServiceCenter";
		}
		else{
			msg="1:1 문의 답변달기 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "library/serviceCenter/updateQuestion";
	}
	
}
