package com.ebooklibrary.app.mybooks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mybooks")
public class MybooksController {
	
	
	
	@RequestMapping("/mybookmain.do")
	public String mybooksMain(){
		return "mybooks/mybookmain";
	}
	
	@RequestMapping("/bookletTest.do")
	public String bookletTest(){
		return "mybooks/NewFile";
	}
	
}
