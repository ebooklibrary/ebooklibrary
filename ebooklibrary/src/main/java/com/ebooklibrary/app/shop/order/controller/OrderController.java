package com.ebooklibrary.app.shop.order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

import com.ebooklibrary.app.common.DateSearchVO;
import com.ebooklibrary.app.common.PaginationInfo;
import com.ebooklibrary.app.common.Utility;
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;
import com.ebooklibrary.app.mybooks.model.MyBookService;
import com.ebooklibrary.app.mybooks.model.MyBookVO;
import com.ebooklibrary.app.shop.cart.model.CartService;
import com.ebooklibrary.app.shop.cart.model.CartVO;
import com.ebooklibrary.app.shop.order.model.OrderService;
import com.ebooklibrary.app.shop.order.model.OrderVO;

@Controller
@RequestMapping("/shop/order")
public class OrderController {
	private static final Logger logger=
			LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MyBookService myBookService;
	
	@RequestMapping("/myBooksInsert.do")	
	public String myBooksInsert(@ModelAttribute OrderVO orderVo,HttpSession session,Model model){
		logger.info("내책리스트에 책추가");
		String userId=(String)session.getAttribute("userId");
		List<Map<String, Object>> cartList=cartService.selectCartView(userId);		
		logger.info("카트뷰 cartList={}",cartList.size());
		List<OrderVO> orderList=new ArrayList<OrderVO>();
		for(int i=0;i<cartList.size();i++){
			Map<String, Object> map=cartList.get(i);
			orderVo.setUserId(userId);
			logger.info("price={}",((Number)map.get("PRICE")).intValue());
			orderVo.setPrice(((Number)map.get("PRICE")).intValue());
			orderVo.setBookNo(((Number)map.get("BOOK_NO")).intValue());
			if(((Number)map.get("RENT_DATE")).intValue()==0){
				orderVo.setBuyClass("B");
			}else{
				orderVo.setBuyClass("R");
			}
			if(orderVo.getImpUid()==null || orderVo.getImpUid().isEmpty()){
				orderVo.setImpUid("");
				orderVo.setMerchantUid("");
				orderVo.setApplyNum("");
			}
			orderVo.setTitle((String)map.get("TITLE"));
			orderVo.setCoverFileName((String)map.get("COVER_FILE_NAME"));
			orderList.add(orderVo);
			logger.info("책커버={}",(String)map.get("COVER_FILE_NAME"));
		}
		int cnt=orderService.MyBooksInsert(cartList,orderList);
		MemberVO memberVo=memberService.selectByUserName(userId);
		model.addAttribute("cartList", cartList);
		model.addAttribute("memberVo", memberVo);
		return "shop/order/orderComplete";
	}
	
	@RequestMapping("/orderList.do")
	public String orderList(
		@ModelAttribute DateSearchVO searchVo,
		HttpSession session, Model model){
		//1.
		String userid=(String)session.getAttribute("userId");
		searchVo.setCustomerId(userid);
		
		logger.info("주문 내역 화면, 파라미터 searchVo={}",
			searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		
		if(searchVo.getStartDay()==null 
				|| searchVo.getStartDay().isEmpty()){				
			Date d = new Date();
			SimpleDateFormat sdf 
				= new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(d);
			
			searchVo.setStartDay(today);
			searchVo.setEndDay(today);
		}
		logger.info("날짜 셋팅 후 searchVo={}", searchVo);
		
		//2.
		//페이징 처리를 위한 셋팅
		//[1]
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.MEMO_COUNT_PER_PAGE);
		
		//[2]
		searchVo.setRecordCountPerPage(Utility.MEMO_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<OrderVO> orderList=orderService.selectOrderAll(searchVo);
		List<MyBookVO> bookList=new ArrayList<MyBookVO>();
		for(int i=0;i<orderList.size();i++){
			OrderVO vo=orderList.get(i);
			MyBookVO mybook=myBookService.selectBookByBookNo(vo.getBookNo());
			bookList.add(mybook);
		}
		int totalRecord=orderService.selectOrderCount(searchVo);
		
		pagingInfo.setTotalRecord(totalRecord);
		//3.
		model.addAttribute("orderList", orderList);
		model.addAttribute("bookList", bookList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "member/orderList";
	}
	
}
