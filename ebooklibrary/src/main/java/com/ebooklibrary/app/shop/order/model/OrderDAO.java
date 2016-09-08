package com.ebooklibrary.app.shop.order.model;

import java.util.Map;

public interface OrderDAO {
	public int insertOrders(OrderVO orderVo);
	public int insertOrderDetails(Map<String, Object> map);
	public int deleteCartByUserid(String userid);
	
	
}
