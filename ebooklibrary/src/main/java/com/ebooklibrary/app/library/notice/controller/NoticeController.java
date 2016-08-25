package com.ebooklibrary.app.library.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ebooklibrary.app.library.notice.model.NoticeService;
import com.ebooklibrary.app.library.notice.model.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/noticelist.do", method = RequestMethod.GET)
	public String insertNotice_get(){
		logger.info("공지사항 입력 보여주기");
		
		
		return "notice/noticelist";
	}
	
	@RequestMapping(value ="/noticelist.do", method = RequestMethod.POST)
	public String insertNotice_post(@RequestParam NoticeVO noticeVo){
		logger.info("공지사항 입력 처리");
		
		int cnt = noticeService.insertNotice(noticeVo);
		return "";
	}
}
