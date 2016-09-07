package com.ebooklibrary.app.library.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ebooklibrary.app.common.BookUtility;
import com.ebooklibrary.app.common.FileUploadWebUtil;
import com.ebooklibrary.app.common.PaginationInfo;
import com.ebooklibrary.app.common.SearchVO;
import com.ebooklibrary.app.common.Utility;
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;
import com.ebooklibrary.app.mybooks.model.MyBookService;
import com.ebooklibrary.app.mybooks.model.MyBookVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	FileUploadWebUtil fileUtil;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MyBookService myBookService;
	
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
	
	@RequestMapping("/book/registerBook.do")
	public void registerBook(){}
	
	@RequestMapping("/book/uploadBook.do")
	public String uploadBook(HttpServletRequest request,@ModelAttribute MyBookVO myBookVo, Model model){
		
		
		
		//파일 업로드 처리
		int uploadType=FileUploadWebUtil.PDS_UPLOAD;
		//=>상품 등록시 이미지 업로드
		List<Map<String, Object>> fileList=fileUtil.fileUpload(request, uploadType);
		logger.info("업로드 파일 List.size={}", fileList.size());
		
		String fileName="";
		String upPath="";
		long fileSize=0;
		for (Map<String, Object> mymap : fileList) {
			fileName=(String)mymap.get("fileName");
			upPath=(String)mymap.get("upPath");
			fileSize=(Long)mymap.get("fileSize");
			logger.info("업로드 파일 fileName={},upPath={}", fileName,upPath);
			int idx=fileName.indexOf(".");
			String sub=fileName.substring(idx+1);
			
			if (sub.equalsIgnoreCase("txt")) {
				myBookVo.setBookFileName(fileName);
				myBookVo.setBookFileSize(fileSize);
			}else{
				myBookVo.setCoverFileName(fileName);
			}
		}
		
		
		logger.info("에이젝스 이미지 등록 들어왔니 myBookVo={}",myBookVo);
		
		logger.info("업로드 파일 fileName={},upPath={}", fileName,upPath);
		
		int cnt=myBookService.insertBook(myBookVo);
		
		return "redirect:/book/registerBook.do";
	}
	
	
}
