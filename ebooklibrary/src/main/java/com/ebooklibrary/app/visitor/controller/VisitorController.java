package com.ebooklibrary.app.visitor.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.visitor.model.VisitorService;
import com.ebooklibrary.app.visitor.model.VisitorVO;

@Controller
public class VisitorController {
	private static final Logger logger = LoggerFactory.getLogger(VisitorController.class);
	
	@Autowired
	private VisitorService visitorService;

	@RequestMapping("/visitor.do")
	@ResponseBody
	public void visitor(HttpSession session){		
		int minus=visitorService.selectMaxDate();
		String visitor=(String)session.getAttribute("visitor");
		logger.info("방문자 증가 minus={},visitor={}",minus,visitor);
		if(visitor==null || visitor.isEmpty()){
			int totalSum=visitorService.selectTotalSum();
			if(minus>0){
				visitorService.insertSysdate();
				visitorService.updateTotalVisitor(totalSum);
			}else{				
				visitorService.updateTodayVisitor();
				totalSum=visitorService.selectTotalSum();
				visitorService.updateTotalVisitor(totalSum);
			}
			session.setAttribute("visitor", "Y");
		}				
	}
	
	@RequestMapping("/visitorBottom.do")
	@ResponseBody
	public VisitorVO visitor_b(){
		logger.info("오늘 방문자");
		return visitorService.selectToday();
	}
}
