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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.common.BookUtility;
import com.ebooklibrary.app.common.FileUploadWebUtil;
import com.ebooklibrary.app.common.PaginationInfo;
import com.ebooklibrary.app.common.Utility;
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;
import com.ebooklibrary.app.mybooks.model.BookSearchVO;
import com.ebooklibrary.app.mybooks.model.MyBookService;
import com.ebooklibrary.app.mybooks.model.MyBookVO;
import com.ebooklibrary.app.mybooks.model.MyBooksVO;

@Controller
@RequestMapping("/mybooks")
public class MybooksController {
	
	@Autowired
	FileUploadWebUtil fileUtil;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MyBookService myBookService;
	
	private static final Logger logger=LoggerFactory.getLogger(MybooksController.class);
	
	@RequestMapping("/mybookmain.do")
	public String mybooksMain(HttpSession session, Model model){
		
		BookUtility bu=new BookUtility();
		String userId=(String)session.getAttribute("userId");
		
		if(userId!=null || !userId.isEmpty()){
			
			List<Map<String, Object>> alist=myBookService.selectBookByUserId(userId);
			logger.info("책 alist={}", alist);
			
			model.addAttribute("alist", alist);
			
			//이미지 파일명 업데이트
			MemberVO memVo=memberService.selectByUserName(userId);
			String bgImage = bu.toUtf(memVo.getBgImage());
			
			model.addAttribute("bgImage", bgImage);
			
			return "mybooks/mybookmain";
		}
		
		
		return "index";
	}
	
	@RequestMapping("/mybookTest.do")
	public String bookletTestOpen(Model model){
		BookUtility bu=new BookUtility();
		List<String> alist=bu.getBookByLine("1", "1");
		model.addAttribute("alist", alist);
		return "mybooks/mybook";
	}
	@RequestMapping("/mybook.do")
	public void bookletTest(HttpServletRequest request, HttpSession session,@RequestParam int bookNo , Model model){
		
		BookUtility bu=new BookUtility();
		String userId=(String)session.getAttribute("userId");
		
		String bookFileName="";
		String upPath="";
		if(userId!=null || !userId.isEmpty()){
			
			//List<MyBooksVO> alist=myBookService.selectMyBooksByUserId(userId);
			
			//이미지 파일명 업데이트
			MyBookVO myBookVo=myBookService.selectBookByBookNo(bookNo);
			bookFileName = myBookVo.getBookFileName();
			upPath=fileUtil.getUploadPath(request, fileUtil.PDS_UPLOAD);
			
			model.addAttribute("title", myBookVo.getTitle());
		}
		List<String> alist=bu.getBook(bookFileName, upPath);
        
        model.addAttribute("alist", alist);
        
		//return "mybooks/mybook";
	}
	
	@RequestMapping("/changeBackImg.do")
	@ResponseBody
	public String changeBackImg(HttpSession session, HttpServletRequest request){
		BookUtility bu=new BookUtility();
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
			String newimg = bu.toUtf(memberVo.getBgImage());

			return newimg;
		}else{
			logger.info("처리 안됐어 다시 해봐");
			String oldimg = bu.toUtf(memberVo.getBgImage());
			return oldimg;
		}
		
		/*
		List<String> alist=new ArrayList<String>();
		alist.add(upPath);
		alist.add("\\"+fileName);
		
		return alist;
		*/
	}
	
	@RequestMapping("/mybookList.do")
	public String mybookList(HttpServletRequest request,@ModelAttribute BookSearchVO searchVo, Model model){
		
		logger.info("책리스트 파라미터 searchVo={}", searchVo);
		
		BookUtility bu=new BookUtility();
		HttpSession session=request.getSession();
		String userId="";
		List<Map<String, Object>> myBooksList=null;
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] searchVO
		searchVo.setBlockSize(Utility.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		String keyword=searchVo.getSearchKeyword();
		
		logger.info("서치 쁘이오 키워드={}",keyword);
		
		
		
		if (session.getAttribute("userId")!=null) {
			userId=(String)session.getAttribute("userId");
			searchVo.setUserId(userId);
			
			int cnt=myBookService.myBookCount(searchVo);
			
			logger.info("토탈 레코드 cnt={}",cnt);
			pagingInfo.setTotalRecord(cnt);
			
			myBooksList=myBookService.selectMyBookListByUserId(searchVo);
			logger.info("책검색 myBooksList={}",myBooksList);
		}
		logger.info("책검색 alist.size()={}", myBooksList.size());
		
		
		String upPath=fileUtil.getUploadPath(request, fileUtil.PDS_UPLOAD);
		
		model.addAttribute("upPath", upPath);
		model.addAttribute("alist", myBooksList);
		model.addAttribute("pagingInfo",pagingInfo);
		
		model.addAttribute("bookSearchVo", searchVo);
		
		
		return "mybooks/mybookList";
	}
	
	@RequestMapping("/deleteMybook")
	public String deleteMybook(HttpServletRequest request, @RequestParam int bookNo, @RequestParam String hide){
		logger.info("삭제 파라미터 bookNo={},hide={}",bookNo,hide);
		HttpSession session=request.getSession();
		String userId="";
		MyBooksVO booksVo=new MyBooksVO();
		
		booksVo.setBookNo(bookNo);
		booksVo.setHide(hide);
		
		if (session.getAttribute("userId")!=null) {
			userId=(String)session.getAttribute("userId");
			booksVo.setUserId(userId);
			int cnt=myBookService.showHideMyBook(booksVo);
			logger.info("감추기 처리 cnt={}",cnt);
		}
		
		/*
		if (session.getAttribute("userId")!=null) {
			userId=(String)session.getAttribute("userId");
			booksVo.setUserId(userId);
			int cnt=myBookService.deleteMybook(booksVo);
			logger.info("삭제 처리 cnt={}",cnt);
		}
		*/
		return "redirect:/mybooks/mybookList.do";
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
