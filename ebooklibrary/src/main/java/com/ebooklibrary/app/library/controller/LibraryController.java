package com.ebooklibrary.app.library.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.member.model.MemberVO;
import com.ebooklibrary.app.mybooks.model.MyBookService;
import com.ebooklibrary.app.mybooks.model.MyBookVO;
import com.ebooklibrary.app.shop.cart.controller.CartController;
import com.ebooklibrary.app.shop.cart.model.CartService;

@Controller
@RequestMapping("/library")
public class LibraryController {
	
	private static final Logger logger=LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private MyBookService myBookService;
	
	@RequestMapping("/librarymain.do")
	public String libmain(){
		//도서관 메인화면
		return "library/librarymain";
	}
	
	@RequestMapping("/mainCart")
	@ResponseBody
	public List<MyBookVO> mainCart(@RequestParam String userId){
		
		logger.info("장바구니 보여주기 파라미터 userId={}",userId);
		//2.
		List<MyBookVO> alist=myBookService.selectCartByUserId(userId);
		
		return alist;
	}
	
	@RequestMapping("/mainBook")
	@ResponseBody
	public List<MyBookVO> mainBook(){
		
		//2.
		List<MyBookVO> alist=myBookService.mainBook();
		
		logger.info("베스트셀러 파라미터 alist.size()={}",alist.size());
		return alist;
	}
	
}
