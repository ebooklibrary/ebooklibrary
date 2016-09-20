package com.ebooklibrary.app.cash.model;

import com.ebooklibrary.app.member.model.MemberVO;

public interface CashService {
	public int updateCash(MemberVO vo);
	public int updateMinusCash(MemberVO vo);
	public int insertCashCharge(CashVO vo);
}
