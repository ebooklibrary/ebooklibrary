package com.ebooklibrary.app.library.ServiceCenter.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ebooklibrary.app.library.notice.model.NoticeDAO;
import com.ebooklibrary.app.library.notice.model.NoticeVO;
import com.ebooklibrary.app.library.stiemap.controller.SiteMapController;

@Controller
@RequestMapping("/library/serviceCenter")
public class ServiceCenterController {
	public static final Logger logger = LoggerFactory.getLogger(SiteMapController.class);
	
	@Autowired
	private NoticeDAO noticeDao;
	
	@RequestMapping(value ="/libraryServiceCenter.do", method = RequestMethod.GET)
	public String noticeWrite_get(){
		logger.info("고객센터 화면 보여주기");
		
		return "library/serviceCenter/libraryServiceCenter";
	}
	
	
	@RequestMapping("/serviceNotice.do")
	public String ServiceNotice(Model model){
		logger.info("서비스센터 공지사항 보여주기");
		List<NoticeVO> noticeVo = noticeDao.selectServiceCenterNotice();
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "library/serviceCenter/serviceNotice";
	}
}
