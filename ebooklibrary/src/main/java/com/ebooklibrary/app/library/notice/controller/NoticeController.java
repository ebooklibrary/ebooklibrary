package com.ebooklibrary.app.library.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ebooklibrary.app.library.notice.model.NoticeService;
import com.ebooklibrary.app.library.notice.model.NoticeVO;

@Controller
@RequestMapping("/library/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/noticelist.do", method = RequestMethod.GET)
	public String list(){
		logger.info("공지사항 리스트 보여주기");
		
		
		return "library/notice/noticelist";
	}
	
	@RequestMapping(value ="/noticewrite.do", method = RequestMethod.GET)
	public String noticeWrite_get(){
		logger.info("공지사항 입력 보여주기");
		
		return "notice/noticewrite";
	}
	
	@RequestMapping(value ="/noticewrite.do", method = RequestMethod.POST)
	public String noticeWrite_post(@RequestParam NoticeVO noticeVo){
		logger.info("공지사항 입력 처리");
		
		int cnt = noticeService.insertNotice(noticeVo);
		String msg = "" , url ="";
		if(cnt>0){
			msg="공지사항 입력 성공";
			url="/library/notice/noticelist.do";
		}else{
			msg="공지사항 입력 실패";
			url="/library/notice/noticewrite.do";
		}
			
		return "common/message";
	}
	
	@RequestMapping("noticedetail.do")
	public String selectByNoNotice(@RequestParam (defaultValue="0")int notice_No,Model model){
		logger.info("공지사항 상세보기");
		
		if(notice_No==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/notice/noticelist.do");
		}
		
		NoticeVO noticeVo = noticeService.selectByNoNotice(notice_No);
		model.addAttribute("noticeVo", noticeVo);
		
		return "/notice/noticelist";
		
	}
	
	@RequestMapping(value ="noticeEdit.do" , method=RequestMethod.GET)
	public String editNoitce_get(@ModelAttribute NoticeVO noticeVo , Model model){
		/*공지사항 수정 화면보여주기*/
		/*공지사항 번호 가져오기*/
		int notice_No = noticeVo.getNotice_No();
		logger.info("관리자용 공지사항 수정 화면 보여주기");
		
		noticeVo = noticeService.selectByNoNotice(notice_No);
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "/notice/noticeEdit";
		
	}
	
	@RequestMapping(value ="noticeEdit.do" , method=RequestMethod.POST)
	public String editNotice_post(@ModelAttribute NoticeVO noticeVo, Model model){ 
		logger.info("관리자용 공지사항 수정처리");
		
		int cnt = noticeService.editNotice(noticeVo);
		
		String msg ="" , url ="";
		if(cnt>0){
			msg="공지사항 수정 성공";
			url="noticelist.do";
		}else{
			msg="공지사항 수정 실패";
			url="noticeEdit.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value="noticeDelete.do", method=RequestMethod.GET)
	public String deleteNotice_get(@ModelAttribute NoticeVO noticeVo,Model model){
		logger.info("관리자용 삭제 화면 보여주기");
		
		int notice_No = noticeVo.getNotice_No();
		
		logger.info("삭제할 공지사항 번호 notice_No={}"+notice_No);
		
		return "";
	}
}
