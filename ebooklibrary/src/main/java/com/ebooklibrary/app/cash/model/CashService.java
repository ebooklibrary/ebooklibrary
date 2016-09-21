package com.ebooklibrary.app.cash.model;

import com.ebooklibrary.app.member.model.MemberVO;
import com.ebooklibrary.app.shop.order.model.OrderVO;

public interface CashService {
	public int updateCash(MemberVO vo);
	public int updateMinusCash(MemberVO vo);
	public int insertCashCharge(OrderVO vo);
}
