package com.ebooklibrary.app.event.model;

import java.util.List;

public interface EventDAO {
	public int insertEvent(EventVO eventVo);
	public List<EventVO> selectEvent();
}
