package com.ebooklibrary.app.visitor.model;

public interface VisitorDAO {
	public int selectMaxDate();
	public int insertSysdate();
	public int selectTotalSum();
	public int updateTotalVisitor(int totalVisitor);
	public int updateTodayVisitor();
	public VisitorVO selectToday();
}
