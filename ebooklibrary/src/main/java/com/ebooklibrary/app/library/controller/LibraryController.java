package com.ebooklibrary.app.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/library")
public class LibraryController {
	
	@RequestMapping("/librarymain.do")
	public String libmain(){
		//도서관 메인화면
		return "library/librarymain";
	}
	
	
}
