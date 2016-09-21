package com.ebooklibrary.app.shop.order.controller;

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

import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;
import com.ebooklibrary.app.shop.cart.model.CartService;
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
	
	@RequestMapping("/myBooksInsert.do")	
	public String myBooksInsert(HttpSession session,Model model){
		logger.info("내책리스트에 책추가");
		String userId=(String)session.getAttribute("userId");
		List<Map<String, Object>> cartList=cartService.selectCartView(userId);
		logger.info("카트뷰 cartList={}",cartList.size());
		int cnt=orderService.MyBooksInsert(cartList);
		MemberVO memberVo=memberService.selectByUserName(userId);
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("memberVo", memberVo);
		return "shop/order/orderComplete";
	}
	
}
