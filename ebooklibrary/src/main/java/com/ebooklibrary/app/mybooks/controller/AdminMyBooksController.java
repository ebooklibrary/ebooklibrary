package com.ebooklibrary.app.mybooks.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.ebooklibrary.app.common.FileUploadWebUtil;
import com.ebooklibrary.app.mybooks.model.MyBookService;
import com.ebooklibrary.app.mybooks.model.MyBookVO;

@Controller
@RequestMapping("/admin")
public class AdminMyBooksController {
	private static final Logger logger=LoggerFactory.getLogger(AdminMyBooksController.class);
	
	@Autowired
	FileUploadWebUtil fileUtil;
	
	@Autowired
	private MyBookService myBookService;
	
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
		
		return "redirect:/admin/book/registerBook.do";
	}
	
	@RequestMapping("/book/bookList.do")
	public String bookList(@RequestParam String searchKeyword, Model model){
		logger.info("책리스트 파라미터 searchKeyword={}", searchKeyword);
		
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "library/book/bookList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
