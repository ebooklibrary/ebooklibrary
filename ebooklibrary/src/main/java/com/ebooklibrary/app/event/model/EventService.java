package com.ebooklibrary.app.event.model;

import java.util.List;

public interface EventService {
	public static final int MAIN_EVENT=1;
	public static final int RECOMMAND_EVENT=2;
	public static final int BEST_EVENT=3;
	
	public int insertEvent(EventVO eventVo);
	public List<EventVO> selectEvent();
}
