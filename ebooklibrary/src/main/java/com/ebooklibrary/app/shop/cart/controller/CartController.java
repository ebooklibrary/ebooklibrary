package com.ebooklibrary.app.shop.cart.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;
import com.ebooklibrary.app.shop.cart.model.CartService;
import com.ebooklibrary.app.shop.cart.model.CartVO;

@Controller
@RequestMapping("/shop/cart")
public class CartController {
	private static final Logger logger=LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/cartList.do")
	public String cartView(HttpSession session,Model model){
		//1.
		String userId=(String)session.getAttribute("userId");
		logger.info("장바구니 보여주기 파라미터 userId={}",userId);
		//2.
		List<Map<String, Object>> alist=cartService.selectCartView(userId);
		MemberVO memberVo=memberService.selectByUserName(userId);
		//3.
		model.addAttribute("cartList", alist);
		model.addAttribute("memberVo", memberVo);
		
		return "/shop/cart/cartList";
	}
	
	@RequestMapping("/cartInsert")
	@ResponseBody
	public int cartInsert(@ModelAttribute CartVO cartVo,Model model){
		
		logger.info("카트담기 cartVo={}",cartVo);
		int cnt=cartService.insertCartPd(cartVo);
		
		if (cnt<0) {
			logger.info("카트담기 후 cnt={}",cnt);
		}
		return cnt;
	}
	@RequestMapping("/extendBook")
	public String extendBook(@ModelAttribute CartVO cartVo,Model model){
		
		logger.info("카트담기 cartVo={}",cartVo);
		cartService.insertCartPd(cartVo);
		
		return "redirect:/shop/cart/cartList.do";
	}
	
	
	
	@RequestMapping("/updateCart")
	@ResponseBody
	public void updateCart(@ModelAttribute CartVO cartVo){
		logger.info("장바구니 변경 에이젝스 cartVo={}",cartVo);
		int days=cartVo.getRentDate();
		//rentEnd
		Date today=new Date();
		today.setDate(today.getDate()+days);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String endDate = sdf.format(today);
		
		logger.info("장바구니 날짜 endDate={}",endDate);
		//price 
		cartVo.setPrice(days*100);
		cartVo.setRentEnd(endDate);
		//책번호로 책조회한후 구매누를시 책가격 cartVo에 입력,렌트!=0 렌트값 입력
		
		cartService.updateCart(cartVo);
	}
	
	@RequestMapping("/bookPurchase")
	public String afterPurchase(@ModelAttribute CartVO cartVo){
		logger.info("구매 후 cartVo={}",cartVo);
		
		return "redirect:/shop/cart/cartList.do";
	}
	
	@RequestMapping("/delCart")
	@ResponseBody
	public void delCart(@RequestParam(defaultValue="0") int cartNo){
		logger.info("장바구니 삭제 cartNo={}",cartNo);
		
		int cnt=cartService.delCart(cartNo);
		
		logger.info("장바구니 삭제됐는가 cnt={}",cnt);
	}
	
	
}
