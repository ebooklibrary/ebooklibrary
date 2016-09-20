package com.ebooklibrary.app.shop.order.model;

import java.util.List;
import java.util.Map;

public interface OrderService {
	public int insertOrders(OrderVO orderVo);
	public int MyBooksInsert(List<Map<String, Object>> cartList);
	
	
}
