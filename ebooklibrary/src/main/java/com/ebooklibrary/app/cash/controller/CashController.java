package com.ebooklibrary.app.cash.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.cash.model.CashService;
import com.ebooklibrary.app.cash.model.CashVO;
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;
import com.ebooklibrary.app.shop.order.model.OrderVO;

@Controller
@RequestMapping("/cash")
public class CashController {
	private static final Logger logger=
			LoggerFactory.getLogger(CashController.class);
	
	@Autowired
	private CashService cashService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/cashAdd.do")
	public String cashAdd(HttpSession session,Model model){
		logger.info("북코인 충전화면 보여주기");
		String userId=(String)session.getAttribute("userId");
		MemberVO vo=memberService.selectByUserName(userId);
		model.addAttribute("vo", vo);
		return "member/cashAdd";
	}
	
	@RequestMapping("/cashAddOk.do")
	@ResponseBody
	public int cashAddOk(@ModelAttribute MemberVO vo){
		logger.info("캐시충전완료 후 캐시업데이트");
		int cnt=cashService.updateCash(vo);
		return cnt;
	}
	
	@RequestMapping("/cashMinusOk.do")
	@ResponseBody
	public int cashMinusOk(@ModelAttribute MemberVO vo){
		logger.info("캐시충전실패 후 캐시업데이트");
		int cnt=cashService.updateMinusCash(vo);
		return cnt;
	}
	
	@RequestMapping("/cashCharge.do")
	@ResponseBody
	public int cashCharge(HttpSession session,@ModelAttribute OrderVO orderVo){		
		String userId=(String)session.getAttribute("userId");
		orderVo.setUserId(userId);
		orderVo.setBuyClass("C");
		logger.info("캐시충전 정보 저장하기 파라미터 orderVo={}",orderVo);
		
		int cnt=cashService.insertCashCharge(orderVo);
		return cnt;
	}
}
