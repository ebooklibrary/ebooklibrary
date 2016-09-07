package com.ebooklibrary.app.mybooks.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.common.BookUtility;
import com.ebooklibrary.app.common.FileUploadWebUtil;
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;

@Controller
@RequestMapping("/mybooks")
public class MybooksController {
	
	@Autowired
	FileUploadWebUtil fileUtil;
	
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger=LoggerFactory.getLogger(MybooksController.class);
	
	@RequestMapping("/mybookmain.do")
	public String mybooksMain(HttpSession session, Model model){
		
		String userId=(String)session.getAttribute("userId");
		
		//이미지 파일명 업데이트
		MemberVO memVo=memberService.selectByUserName(userId);
		String bgImage = toUtf(memVo.getBgImage());
		
		model.addAttribute("bgImage", bgImage);
		
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
	public String changeBackImg(HttpSession session, HttpServletRequest request){
		
		
		/*
		"userId"
		"auchCode"
		"memberNo"
		"userName"
		*/
		
		
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
		
		String userId=(String)session.getAttribute("userId");
		logger.info("배경 바꾸기 userId={}", userId);
		
		//fileName=fileName.replaceAll(" ", "");
		
		MemberVO memberVo=new MemberVO();
		memberVo.setUserId(userId);
		memberVo.setBgImage(fileName);
		logger.info("fileName={}", fileName);
		
		//이미지 파일명 업데이트
		MemberVO memVo=memberService.selectByUserName(userId);
		String oldImage=memVo.getBgImage();
		int cnt=memberService.updateBackImg(memberVo);
		
		if (cnt>0) {
			//기존 파일이 존재하면, 기존 파일 삭제
			File oldFile=new File(upPath ,oldImage);
			if (oldFile.exists()) {
				boolean bool=oldFile.delete();
				logger.info("기존 파일 삭제 여부={}", bool);
			}
			String newimg = toUtf(memberVo.getBgImage());

			return newimg;
		}else{
			logger.info("처리 안됐어 다시 해봐");
			String oldimg = toUtf(memberVo.getBgImage());
			return oldimg;
		}
		
		/*
		List<String> alist=new ArrayList<String>();
		alist.add(upPath);
		alist.add("\\"+fileName);
		
		return alist;
		*/
	}
	
	public static String toUtf(String str) { 
	
		String utf = ""; 
		
			try {
				utf = URLEncoder.encode(str , "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
		return utf; 
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
