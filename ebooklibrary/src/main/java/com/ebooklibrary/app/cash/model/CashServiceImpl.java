package com.ebooklibrary.app.cash.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebooklibrary.app.member.model.MemberVO;

@Service
public class CashServiceImpl implements CashService{
	
	@Autowired
	private CashDAO cashDao;
	
	@Override
	public int updateCash(MemberVO vo) {
		return cashDao.updateCash(vo);
	}

	@Override
	public int updateMinusCash(MemberVO vo) {
		return cashDao.updateMinusCash(vo);
	}

	@Override
	public int insertCashCharge(CashVO vo) {
		return cashDao.insertCashCharge(vo);
	}
}
