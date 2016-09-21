package com.ebooklibrary.app.shop.cart.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOMybatis extends SqlSessionDaoSupport implements CartDAO{
	
	private String namespace="com.mybatis.mapper.oracle.cart";
	
	@Override
	public int selectCountCart(CartVO cartVo) {
		return getSqlSession().selectOne(namespace+".selectCount", cartVo);
	}	

	@Override
	public int insertCartPd(CartVO cartVo) {
		return getSqlSession().insert(namespace+".insertCartPd", cartVo);
	}

	@Override
	public List<Map<String, Object>> selectCartView(String userId) {
		return getSqlSession().selectList(namespace+".selectCartView", userId);
	}

	@Override
	public int updateCart(CartVO cartVo) {
		return getSqlSession().update(namespace+".updateCart", cartVo);
	}

	@Override
	public int delCart(int cartNo) {
		return getSqlSession().delete(namespace+".delCart", cartNo);
	}
	@Override
	public int deleteCart(Map<String, Object> map) {
		return getSqlSession().delete(namespace+".deleteCart", map);
	}

}
