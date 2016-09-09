package com.ebooklibrary.app.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	
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
	public String login_get(){
		
		return "member/login";
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login_post(@RequestParam String userId 
			, @RequestParam String pwd,
			HttpServletRequest request,HttpServletResponse response
			,Model model){
		
		int result=memberService.logincheck(userId, pwd);
		String msg="",url="/member/login.do";
		if(result==MemberService.LOGIN_OK){
			MemberVO memberVo=memberService.selectByUserName(userId);
			HttpSession session=request.getSession();
			session.setAttribute("userId", memberVo.getUserId());
			session.setAttribute("auchCode", memberVo.getAuthCode());
			session.setAttribute("memberNo", memberVo.getMemberNo());
			session.setAttribute("userName", memberVo.getUserName());
			msg=memberVo.getUserName()+"님 로그인하였습니다";
			url="/index.do";
			
		}else if(result==memberService.PWD_DISAGREE){
			msg="비밀번호가 다릅니다";
		}else if(result==memberService.ID_NONE){
			msg="아이디가 없습니다";
		}else{
			msg="로그인 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String memberLogout(HttpSession session,Model model){
		session.invalidate();
		model.addAttribute("msg", "로그아웃 되었습니다");
		model.addAttribute("url", "/member/login.do");
		return "common/message";
	}
	@RequestMapping("/chkId.do")
	@ResponseBody
	public int chkId(@RequestParam String userId){
		return memberService.selectMemberCheckId(userId);
	}
	
	@RequestMapping("/myInfoChk.do")
	public String myInfoChk(HttpSession session,@RequestParam String pwd,
			Model model){
		String userId=(String)session.getAttribute("userId");
		int result=memberService.logincheck(userId, pwd);
		String msg="",url="/member/login.do";
		if(result==MemberService.LOGIN_OK){
			MemberVO memberVo=memberService.selectByUserName(userId);
			model.addAttribute("memberVo", memberVo);
			return "member/myInfo";
		}else if(result==memberService.PWD_DISAGREE){
			msg="비밀번호가 다릅니다";
		}else if(result==memberService.ID_NONE){
			msg="아이디가 없습니다";
		}else{
			msg="로그인 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/myPage.do")
	public void myPageShow(HttpSession session,Model model){
		logger.info("마이페이지 보여주기");
		String userId=(String)session.getAttribute("userId");
		MemberVO memberVo=memberService.selectByUserName(userId);
		
		model.addAttribute("memberVo", memberVo);
	}
}
