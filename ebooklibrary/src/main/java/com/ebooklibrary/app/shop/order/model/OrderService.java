package com.ebooklibrary.app.shop.order.model;

import java.util.List;
import java.util.Map;

public interface OrderService {
	public int insertOrders(List<OrderVO> orderList);
	public int MyBooksInsert(List<Map<String, Object>> cartList,List<OrderVO> orderList);
	
	
}
