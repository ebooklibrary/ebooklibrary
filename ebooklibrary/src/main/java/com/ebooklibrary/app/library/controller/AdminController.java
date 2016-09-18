package com.ebooklibrary.app.library.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
