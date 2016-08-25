package com.ebooklibrary.app.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/register.do",method=RequestMethod.GET )
	public String register_get(){
		//회원가입 첫페이지
		return "member/register";
	}
	
	@RequestMapping(value="/register.do",method=RequestMethod.POST )
	public String register_post(@ModelAttribute MemberVO memberVo,Model model){
		int cnt=memberService.register(memberVo);
		String msg="",url="";
		if(cnt>0){
			msg="회원가입 성공";
			url="/library/librarymain.do";
		}else{
			msg="회원가입 실패";
			url="/library/librarymain.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String login(){
		
		return "";
	}
}
