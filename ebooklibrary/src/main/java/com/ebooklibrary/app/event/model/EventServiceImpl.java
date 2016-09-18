package com.ebooklibrary.app.event.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDAO eventDao;

	@Override
	public int insertEvent(EventVO eventVo) {
		return eventDao.insertEvent(eventVo);
	}

	@Override
	public List<EventVO> selectEvent() {
		return eventDao.selectEvent();
	}

}
