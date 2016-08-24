package com.ebooklibrary.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@RequestMapping("/register.do")
	public String registerMain(){
		//회원가입 첫페이지
		return "member/register";
	}
}
