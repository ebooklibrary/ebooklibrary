package com.ebooklibrary.app.mybooks.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.common.BookUtility;
import com.ebooklibrary.app.common.FileUploadWebUtil;

@Controller
@RequestMapping("/mybooks")
public class MybooksController {
	
	@Autowired
	FileUploadWebUtil fileUtil;
	
	private static final Logger logger=LoggerFactory.getLogger(MybooksController.class);
	
	@RequestMapping("/mybookmain.do")
	public String mybooksMain(HttpServletRequest request, Model model){
		
		
		HttpSession session = request.getSession();
		
		String fileName=(String)session.getAttribute("fileName");
		
		model.addAttribute("bgImage", fileName);
		
		return "mybooks/mybookmain";
	}
	
	@RequestMapping("/mybook.do")
	public String bookletTest(Model model){
		
		BookUtility bu=new BookUtility();
		
		List<String> alist=bu.getBook();
        
        model.addAttribute("alist", alist);
		//model.addAttribute("str", str);
		
		return "mybooks/mybook";
	}
	
	
	
	@RequestMapping("/changeBackImg.do")
	@ResponseBody
	public String changeBackImg(HttpServletRequest request, @RequestParam String oldImage){
		
		logger.info("에이젝스 이미지 등록 들어왔니 oldImage={}",oldImage);
		
		//파일 업로드 처리
		int uploadType=FileUploadWebUtil.IMAGE_UPLOAD;
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
		}
		
		//기존 파일이 존재하면, 기존 파일 삭제
		File oldFile=new File(upPath ,oldImage);
		if (oldFile.exists()) {
			boolean bool=oldFile.delete();
			logger.info("기존 파일 삭제 여부={}", bool);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("fileName", fileName);
		
		return fileName;
	}
	
	
	
	/*
	@RequestMapping("/changeBackImg.do")
	public String changeBackImg(HttpServletRequest request, Model model){
		
		logger.info("상품등록 들어왔니 ");
		
		//파일 업로드 처리
		int uploadType=FileUploadWebUtil.IMAGE_UPLOAD;
		logger.info("이건 타입, uploadType={}", uploadType);

		List<Map<String, Object>> fileList=fileUtil.fileUpload(request, uploadType);
		logger.info("업로드 파일 List.size={}", fileList.size());
		
		String fileName="";
		long fileSize=0;
		for (Map<String, Object> mymap : fileList) {
			fileName=(String)mymap.get("fileName");
			fileSize=(Long)mymap.get("fileSize");
		}
		logger.info("bgImage={}",fileName);
		model.addAttribute("bgImage", fileName);
		
		return "mybooks/mybookmain";
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
