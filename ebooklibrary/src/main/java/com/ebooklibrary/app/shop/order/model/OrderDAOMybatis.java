package com.ebooklibrary.app.shop.order.model;

import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOMybatis extends SqlSessionDaoSupport
	implements OrderDAO{

	private String namespace="com.mybatis.mapper.oracle.order";
	
	@Override
	public int insertOrders(OrderVO orderVo) {
		return getSqlSession().insert(namespace
			+".insertOrders", orderVo);
	}

	@Override
	public int insertOrderDetails(Map<String, Object> map) {
		return getSqlSession().update(namespace
				+".insertOrderDetails", map);
	}

	@Override
	public int deleteCartByUserid(String userid) {
		return getSqlSession().delete(namespace
			+".deleteCartByUserid", userid);
	}

	
}
