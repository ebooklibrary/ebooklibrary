package com.ebooklibrary.app.mybooks.controller;

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
@RequestMapping("/book")
public class BookController {
	private final static Logger logger=
			LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private FileUploadWebUtil fileUtil;
	
	@Autowired
	private MyBookService myBookService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/bookList.do")
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
		/*
		String title=searchVo.getTitle();
		String publisher=searchVo.getPublisher();
		String writer=searchVo.getWriter();
		String genre=searchVo.getGenre();
		logger.info("책검색 키워드 title={},publisher={}",title,publisher);
		logger.info("책검색 키워드 writer={},genre={}",writer,genre);
		if (title!=null || publisher!=null || writer!=null || genre!=null) {
			searchVo.setFirstRecordIndex(0);
			logger.info("책검색 키워드 searchVo.getFirstRecordIndex()={}",searchVo.getFirstRecordIndex());
		}
		*/
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
		
		
		return "library/book/bookList";
	}
	
	@RequestMapping("/bookDetail.do")
	public String bookDetail(HttpServletRequest request,@RequestParam int bookNo, Model model){
		
		HttpSession session=request.getSession();
		String userId="";
		if (session.getAttribute("userId")!=null) {
			userId=(String)session.getAttribute("userId");
		}
		
		MyBooksVO myBooksVo=new MyBooksVO();
		
		myBooksVo.setUserId(userId);
		myBooksVo.setBookNo(bookNo);
		
		myBooksVo=myBookService.selectMyBooksByBookNo(myBooksVo);
		logger.info("책 상세 마이북스 셀렉트 myBooksVo={}",myBooksVo);
		model.addAttribute("myBooksVo", myBooksVo);
		
		
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
		Timestamp pubDate = new Timestamp(parsedDate.getTime());;
		
		model.addAttribute("bookVo", bookVo);
		model.addAttribute("pubDate", pubDate);
		
		
		return "library/book/bookDetail";
	}
}
