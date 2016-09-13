package com.ebooklibrary.app.library.stiemap.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/library/siteMap")
public class SiteMapController {
	public static final Logger logger = LoggerFactory.getLogger(SiteMapController.class);
	
	@RequestMapping(value ="/librarySiteMap.do", method = RequestMethod.GET)
	public String noticeWrite_get(){
		logger.info("사이트맵 화면 보여주기");
		
		return "library/siteMap/librarySiteMap";
	}
	
}
