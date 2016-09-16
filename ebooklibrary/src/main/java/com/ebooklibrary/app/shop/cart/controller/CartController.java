package com.ebooklibrary.app.shop.cart.controller;

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

import com.ebooklibrary.app.shop.cart.model.CartService;
import com.ebooklibrary.app.shop.cart.model.CartVO;

@Controller
@RequestMapping("/shop/cart")
public class CartController {
	private static final Logger logger=
			LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/cartList.do")
	public String cartView(HttpSession session,Model model){
		//1.
		String userId=(String)session.getAttribute("userId");
		logger.info("장바구니 보여주기 파라미터 userId={}",userId);
		//2.
		List<Map<String, Object>> alist=cartService.selectCartView(userId);			
		//3.
		model.addAttribute("cartList", alist);
		
		return "/shop/cart/cartList";
	}
	
	@RequestMapping("/cartInsert")
	public String cartInsert(@ModelAttribute CartVO cartVo,Model model){
		
		logger.info("카트담기 cartVo={}",cartVo);
		int cnt=cartService.insertCartPd(cartVo);
		
		if (cnt<0) {
			logger.info("카트담기 후 cnt={}",cnt);
		}
		
		return "redirect:/shop/cart/cartList.do";
	}
	
}
