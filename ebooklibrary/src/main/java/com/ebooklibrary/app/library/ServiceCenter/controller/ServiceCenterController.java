package com.ebooklibrary.app.library.ServiceCenter.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ebooklibrary.app.library.stiemap.controller.SiteMapController;

@Controller
@RequestMapping("/library/serviceCenter")
public class ServiceCenterController {
	public static final Logger logger = LoggerFactory.getLogger(SiteMapController.class);
	
	@RequestMapping(value ="/librarySiteMap.do", method = RequestMethod.GET)
	public String noticeWrite_get(){
		logger.info("고객센터 화면 보여주기");
		
		return "library/serviceCenter/libraryServiceCenter";
	}
	
}
