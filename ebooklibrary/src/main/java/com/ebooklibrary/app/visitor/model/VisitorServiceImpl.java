package com.ebooklibrary.app.visitor.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitorServiceImpl implements VisitorService {
	
	@Autowired
	private VisitorDAO visitorDao;

	@Override
	public int selectMaxDate() {
		return visitorDao.selectMaxDate();
	}

	@Override
	public int insertSysdate() {
		return visitorDao.insertSysdate();
	}

	@Override
	public int selectTotalSum() {
		return visitorDao.selectTotalSum();
	}

	@Override
	public int updateTotalVisitor(int totalVisitor) {
		return visitorDao.updateTotalVisitor(totalVisitor);
	}

	@Override
	public int updateTodayVisitor() {
		return visitorDao.updateTodayVisitor();
	}

	@Override
	public VisitorVO selectToday() {
		return visitorDao.selectToday();
	}

}
