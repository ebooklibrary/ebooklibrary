package com.ebooklibrary.app.mybooks.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ebooklibrary.app.common.BookUtility;
import com.ebooklibrary.app.common.FileUploadWebUtil;
import com.ebooklibrary.app.common.PaginationInfo;
import com.ebooklibrary.app.common.Utility;
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.mybooks.model.BookSearchVO;
import com.ebooklibrary.app.mybooks.model.MyBookService;
import com.ebooklibrary.app.mybooks.model.MyBookVO;
import com.ebooklibrary.app.mybooks.model.MyBooksVO;
import com.ebooklibrary.app.shop.cart.model.CartService;

@Controller
@RequestMapping("/admin")
public class AdminMyBooksController {
	private static final Logger logger=LoggerFactory.getLogger(AdminMyBooksController.class);
	
	@Autowired
	private FileUploadWebUtil fileUtil;
	
	@Autowired
	private MyBookService myBookService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
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
		
		String oFileName="";
		List<Map<String, Object>> oFileList=fileUtil.OriFileName(request);
		for (Map<String, Object> mymap : oFileList) {
			oFileName=(String)mymap.get("ofileName");
			logger.info("업로드 오리지날 파일명 oFileName={}", oFileName);
			int idx=oFileName.indexOf(".");
			String sub=oFileName.substring(idx+1);
			
			if (sub.equalsIgnoreCase("txt")) {
				myBookVo.setOriBookFileName(oFileName);
			}else{
				myBookVo.setOriCoverFileName(oFileName);
			}
		}
		
		
		logger.info("에이젝스 이미지 등록 들어왔니 myBookVo={}",myBookVo);
		
		logger.info("업로드 파일 fileName={},upPath={}", fileName,upPath);
		
		int cnt=myBookService.insertBook(myBookVo);
		
		return "redirect:/admin/book/registerBook.do";
	}
	
	@RequestMapping("/book/bookList.do")
	public String bookList(HttpServletRequest request,@ModelAttribute BookSearchVO searchVo, Model model){
		logger.info("책리스트 파라미터 searchVo={}", searchVo);
		
		BookUtility bu=new BookUtility();
		HttpSession session=request.getSession();
		String userId="";
		if (session.getAttribute("userId")!=null) {
			userId=(String)session.getAttribute("userId");
			//MemberVO memVo=memberService.selectByUserName(userId);
			List<MyBooksVO> myBooksList=myBookService.selectMyBooksByUserId(userId);
			logger.info("책검색 myBooksList={}",myBooksList);
			model.addAttribute("myBooksList", myBooksList);
		}
		
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
		
		int cnt=myBookService.countAllBook(searchVo);
		logger.info("토탈 레코드 cnt={}",cnt);
		pagingInfo.setTotalRecord(cnt);
		
		List<MyBookVO> alist=myBookService.selectBoolAll(searchVo);
		logger.info("책검색 alist.size()={}", alist.size());
		
		
		String upPath=fileUtil.getUploadPath(request, fileUtil.PDS_UPLOAD);
		
		model.addAttribute("upPath", upPath);
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo",pagingInfo);
		logger.info("토탈 레코드 searchVo={}",searchVo.getCurrentPage());
		model.addAttribute("bookSearchVo", searchVo);
		
		/*사이드 장바구니 목록*/
		List<Map<String, Object>> cartList=cartService.selectCartView(userId);			
		model.addAttribute("cartList", cartList);
		
		
		return "admin/book/bookList";
	}
	

	@RequestMapping("/book/bookDetail.do")
	public String bookDetail(HttpServletRequest request,@RequestParam int bookNo, Model model){
		
		logger.info("책 상세 파라미터 bookNo={}",bookNo);
		
		MyBookVO bookVo=myBookService.selectBookDetail(bookNo);
		
		logger.info("책 상세 셀렉트 bookVo={}",bookVo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = null;
		try {
			parsedDate = sdf.parse(bookVo.getPublication());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp pubDate = new Timestamp(parsedDate.getTime());
		
		model.addAttribute("bookVo", bookVo);
		model.addAttribute("pubDate", pubDate);
		
		return "admin/book/bookDetail";
	}
	
	@RequestMapping("/book/bookDelete.do")
	public String bookDelete(HttpServletRequest request, @RequestParam int bookNo, Model model){
		logger.info("책 삭제 파라미터 bookNo={}",bookNo);
		
		int cnt=myBookService.deleteBooks(bookNo);
		
		logger.info("책 삭제 처리 cnt={}",cnt);
		String upPath=fileUtil.getUploadPath(request, fileUtil.PDS_UPLOAD);
		MyBookVO vo=myBookService.selectBookDetail(bookNo);
		
		String oldBookFile=vo.getBookFileName();
		String oldImage=vo.getCoverFileName();
		
		if (cnt>0) {
			//기존 파일이 존재하면, 기존 파일 삭제
			File oldImg=new File(upPath ,oldImage);
			if (oldImg.exists()) {
				boolean bool=oldImg.delete();
				logger.info("기존 파일 삭제 여부={}", bool);
			}
			File oldBook=new File(upPath ,oldBookFile);
			if (oldBook.exists()) {
				boolean bool=oldBook.delete();
				logger.info("기존 파일 삭제 여부={}", bool);
			}
		}else{
			logger.info("처리 안됐어 다시 해봐");
		}
		
		
		return "redirect:/admin/book/bookList.do";
		
	}
	
	@RequestMapping(value="/book/bookEdit.do", method=RequestMethod.GET)
	public String bookEdit_get(HttpServletRequest request, @RequestParam int bookNo, Model model){
		logger.info("책 수정 파라미터 bookNo={}",bookNo);
		
		MyBookVO bookVo=myBookService.selectBookByBookNo(bookNo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = null;
		try {
			parsedDate = sdf.parse(bookVo.getPublication());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp pubDate = new Timestamp(parsedDate.getTime());
		
		logger.info("책 수정 bookVo={}",bookVo);
		
		model.addAttribute("bookVo", bookVo);
		
		return "admin/book/editBook";
	}
	
	@RequestMapping(value="/book/bookEdit.do", method=RequestMethod.POST)
	public String bookEdit_post(HttpServletRequest request,@ModelAttribute MyBookVO myBookVo, Model model){
		
		logger.info("책 수정 후 파라미터 bookNo={}",myBookVo.getBookNo());
		
		String oBookFile=myBookVo.getBookFileName();	//기존 책파일
		String oCoverFile=myBookVo.getCoverFileName();	//기존 책커버파일
		String oldOriBook=myBookVo.getOriBookFileName(); //기존 책파일 원본
		String oldOriCover=myBookVo.getOriCoverFileName(); //기존 책파일 원본
		logger.info("기존 파일 파라미터 oBookFile={},oldOriBook={}", oBookFile,oldOriBook);
		myBookVo.setOriBookFileName(oBookFile);
		myBookVo.setOriCoverFileName(oCoverFile);
		
		//파일 업로드 처리
		int uploadType=FileUploadWebUtil.PDS_UPLOAD;
		
		//=>상품 등록시 이미지 업로드
		List<Map<String, Object>> fileList=fileUtil.fileUpload(request, uploadType);
		logger.info("업로드 파일 List.size={}", fileList.size());
		
		
		if (fileList!=null && !fileList.isEmpty()) {

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
			logger.info("기존 파일 삭제 upPath={},oBookFile={}", upPath,oBookFile);
			//기존 파일이 존재하면, 기존 파일 삭제
			File oldBookFile=new File(upPath ,oBookFile);
			File oldCoverFile=new File(upPath ,oCoverFile);
			if (oldBookFile.exists()) {
				boolean bool=oldBookFile.delete();
				logger.info("기존 파일 삭제 여부={}", bool);
			}
			if (oldCoverFile.exists()) {
				boolean bool=oldCoverFile.delete();
				logger.info("기존 파일 삭제 여부={}", bool);
			}
			logger.info("업로드 한 경우");
		}else{
			logger.info("업로드 하지 않은 경우");
			//업로드하지 않는 경우
			//=> 기존 파일 정보를 다시 셋팅해준다
			myBookVo.setBookFileName(oBookFile);
			myBookVo.setOriBookFileName(oldOriBook);
			myBookVo.setCoverFileName(oCoverFile);
			myBookVo.setOriCoverFileName(oldOriCover);

		}
		
		logger.info("수정 처리 후 들어왔니 myBookVo={}",myBookVo);
		
		myBookService.bookEdit(myBookVo);
		
		
		return "redirect:/admin/book/bookDetail.do?bookNo="+myBookVo.getBookNo();
	}
	
	
	
	
	
	
	
}
