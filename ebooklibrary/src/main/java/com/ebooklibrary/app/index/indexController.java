package com.ebooklibrary.app.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class indexController {
	
	@RequestMapping("/index.do")
	public String index(){
		
		return "index";
	}
	
	
}
