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
	
	@RequestMapping(value="/orderSheet.do",method=RequestMethod.GET)
	public String orderSheet_get(HttpSession session,Model model){
		
		String userId=(String)session.getAttribute("userId");
		logger.info("주문 보여주기 파라미터 userId={}",userId);
		List<Map<String, Object>> alist=cartService.selectCartView(userId);
		logger.info("주문 보여주기 장바구니 alist={}",alist.size());
		MemberVO memberVo=memberService.selectByUserName(userId);
		logger.info("주문자 정보 보여주기 memberVo={}",memberVo);
		
		model.addAttribute("cartList", alist);
		model.addAttribute("memberVo", memberVo);
		
		return "shop/order/orderSheet";
	}
	@RequestMapping(value="/orderSheet.do",method=RequestMethod.POST)
	public String orderSheet_post(@ModelAttribute OrderVO orderVo,HttpSession session){
		//1.
		String userId=(String)session.getAttribute("userId");
		orderVo.setUserId(userId);
		logger.info("결제하기 파라미터 orderVo={}",orderVo);
		//2.
		int cnt = orderService.insertOrders(orderVo);
		logger.info("결제하기 결과 cnt={}",cnt);
		
		//3.
		return "redirect:/shop/order/orderComplete.do?orderNo="+orderVo.getOrderNo();
	}
}
