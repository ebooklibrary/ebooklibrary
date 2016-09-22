package com.ebooklibrary.app.library.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.common.MemberSearchVO;
import com.ebooklibrary.app.common.PaginationInfo;
import com.ebooklibrary.app.common.PoiExcelSave;
import com.ebooklibrary.app.common.SearchVO;
import com.ebooklibrary.app.common.Utility;
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private PoiExcelSave poiExcelSave;
	
	@RequestMapping("/adminMain.do")
	public String adminMain(){
		return "admin/adminMain";
	}
	
	@RequestMapping(value="/login/adminLogin.do",method=RequestMethod.GET)
	public void login_get(){
		logger.info("관리자 로그인화면 보여주기");		
	}
	
	@RequestMapping(value="/login/adminLogin.do",method=RequestMethod.POST)
	public String login_post(@ModelAttribute MemberVO vo,
			HttpServletRequest request,HttpServletResponse response
			,Model model){
		logger.info("관리자 로그인 memberVo={}",vo);
		int result=memberService.logincheck(vo);
		String msg="",url="/admin/login/adminLogin.do";
		if(result==MemberService.LOGIN_OK){
			MemberVO memberVo=memberService.selectByUserName(vo.getUserId());
			HttpSession session=request.getSession();
			session.setAttribute("adminUserId", memberVo.getUserId());
			session.setAttribute("adminAuchCode", memberVo.getAuthCode());
			session.setAttribute("adminMemberNo", memberVo.getMemberNo());
			msg=memberVo.getUserName()+"관리자님 로그인하였습니다";
			url="/admin/adminMain.do";
			
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
		session.removeAttribute("adminUserId");
		session.removeAttribute("adminAuchCode");
		session.removeAttribute("adminMemberNo");
		model.addAttribute("msg", "로그아웃 되었습니다");
		model.addAttribute("url", "/admin/login/adminLogin.do");
		return "common/message";
	}
	
	@RequestMapping("/member/memberList.do")
	public String adminMemberList(@ModelAttribute SearchVO searchVo,Model model){
		//1.
		//[1] pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.MEMBER_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] searchVo
		searchVo.setBlockSize(Utility.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(Utility.MEMBER_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		logger.info("회원정보 보기 searchVo={}",searchVo);
		//2.
		List<MemberVO> alist=memberService.selectMemberAll(searchVo);
		int totalRecord=memberService.selectMemberCount(searchVo);
		
		pagingInfo.setTotalRecord(totalRecord);
		//3.
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/member/memberList";
	}
	@RequestMapping("/member/memberSave.do")
	@ResponseBody
	public int memberExcelSave(){ 
		logger.info("회원정보 엑셀저장");
		MemberSearchVO vo=new MemberSearchVO();
		
		//[2] searchVo
		vo.setBlockSize(Utility.BLOCK_SIZE);
		vo.setRecordCountPerPage(Utility.MEMBER_COUNT_PER_PAGE);
		vo.setFirstRecordIndex(0);
		
		int result=poiExcelSave.excel(vo);
		logger.info("엑셀 저장 결과 result={}",result);
		
		return result;
	}
	
	
}
