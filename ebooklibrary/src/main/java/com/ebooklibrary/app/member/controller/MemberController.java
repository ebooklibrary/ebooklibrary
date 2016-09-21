package com.ebooklibrary.app.member.controller;

import java.util.HashMap;
import java.util.Map;

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

import com.ebooklibrary.app.email.EmailPwdsearch;
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private EmailPwdsearch emailPwdsearch;
	
	@RequestMapping(value="/register.do",method=RequestMethod.GET )
	public String register_get(){
		//회원가입 첫페이지
		return "member/register";
	}
	

	@RequestMapping(value="/register.do",method=RequestMethod.POST )
	public String register_post(@ModelAttribute MemberVO memberVo,Model model){
		logger.info("회원가입 처리 memberVo={}",memberVo);

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
	
	@RequestMapping(value="/myInfoChk.do",method=RequestMethod.GET)
	public String myInfoChk(@RequestParam(defaultValue="0") int pwdChange){
		return "member/login";
	}
	
	@RequestMapping(value="/myInfoChk.do",method=RequestMethod.POST)
	public String myInfoChk(HttpSession session,@RequestParam String pwd,
			@RequestParam(defaultValue="0") int pwdChange,Model model){
		String userId=(String)session.getAttribute("userId");
		int result=memberService.logincheck(userId, pwd);
		String msg="",url="/member/login.do";
		if(result==MemberService.LOGIN_OK){
			if(pwdChange!=1){
				return "redirect:/member/myInfo.do";
			}else{
				return "redirect:/member/pwdChange.do";
			}			
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
	
	@RequestMapping(value="/pwdChange.do",method=RequestMethod.GET)
	public String pwdChange_get(){
		logger.info("비밀번호 변경화면");
		return "member/pwdChange";
	}
	@RequestMapping(value="/pwdChange.do",method=RequestMethod.POST)
	public String pwdChange_post(@ModelAttribute MemberVO vo,Model model){
		logger.info("비밀번호 변경처리");
		int cnt=memberService.updateTempPwd(vo);
		model.addAttribute("msg", "비밀번호 변경 완료");
		model.addAttribute("url", "/member/myPage.do");
		return "member/pwdChange";
	}
	
	@RequestMapping(value="/myInfo.do",method=RequestMethod.GET)
	public String myInfo_get(HttpSession session,Model model){
		String userId=(String)session.getAttribute("userId");
		MemberVO memberVo=memberService.selectByUserName(userId);
		logger.info("내정보 수정화면 띄우기 memberVo={}",memberVo);
		model.addAttribute("memberVo", memberVo);
		return "member/myInfo";
	}
	
	@RequestMapping(value="/myInfo.do",method=RequestMethod.POST)
	public String myInfo_post(HttpSession session,@ModelAttribute MemberVO memberVo ,Model model){
		String userId=(String)session.getAttribute("userId");
		
		memberVo.setUserId(userId);
		
		memberService.updateUserInfo(memberVo);
		
		logger.info("내정보 수정 처리 memberVo={}",memberVo);
		model.addAttribute("memberVo", memberVo);
		return "member/myInfo";
	}
	
	@RequestMapping("/myPage.do")
	public void myPageShow(HttpSession session,Model model){
		logger.info("마이페이지 보여주기");
		String userId=(String)session.getAttribute("userId");
		MemberVO memberVo=memberService.selectByUserName(userId);
		logger.info("내정보페이지 memberVo={}",memberVo);
		
		model.addAttribute("memberVo", memberVo);
	}
	
	@RequestMapping("/loginForm.do")
	public void loginForm(){
		logger.info("로그인 폼 보여주기");
	}
	
	@RequestMapping(value="/idsearch.do",method=RequestMethod.GET)
	public void idsearch_get(){
		logger.info("아이디찾기 폼 보여주기");
	}
	
	@RequestMapping(value="/idsearch.do",method=RequestMethod.POST)
	public String idsearch_post(@ModelAttribute MemberVO memberVo,Model model){
		logger.info("아이디찾기 memberVo={}",memberVo);
		
		String result=memberService.selectBymemberVo(memberVo);
		model.addAttribute("result", result);
		
		return "member/idsearch";
	}

	@RequestMapping(value="/pwdsearch.do",method=RequestMethod.GET)
	public void pwdsearch_get(){
		logger.info("비밀번호찾기 폼 보여주기");
	}
	
	@RequestMapping(value="/pwdsearch.do",method=RequestMethod.POST)
	public String pwdsearch_post(@ModelAttribute MemberVO vo,Model model){
		logger.info("비밀번호찾기 memberVo={}",vo);
		
		String result=emailPwdsearch.emailSender(vo.getUserId());
		vo.setPwd(result);
		int cnt=memberService.updateTempPwd(vo);
		if(cnt>0){
			model.addAttribute("msg", "임시 비밀번호를 보냈습니다");
			model.addAttribute("url", "/member/pwdsearch.do");
		}else{
			model.addAttribute("msg", "임시 비밀번호 설정 실패");
			model.addAttribute("url", "/member/pwdsearch.do");
		}
		
		return "common/message";
	}
	
	@RequestMapping("/updateCash.do")
	@ResponseBody
	public int updateCash(HttpSession session, @RequestParam int cash){
		logger.info("사용자 캐시 변경 cash={}",cash);
		
		String userId=(String)session.getAttribute("userId");
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("cash", cash);
 		return memberService.updateCash(map);		
	}
	
	
}
