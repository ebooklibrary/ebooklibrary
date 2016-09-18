package com.ebooklibrary.app.event.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOMybatis extends SqlSessionDaoSupport implements EventDAO {
	private String namespace="config.mybatis.mapper.oracle.event";

	@Override
	public int insertEvent(EventVO eventVo) {
		return getSqlSession().insert(namespace+".insertEvent", eventVo);
	}

	@Override
	public List<EventVO> selectEvent() {
		return getSqlSession().selectList(namespace+".selectEvent");
	}
}
