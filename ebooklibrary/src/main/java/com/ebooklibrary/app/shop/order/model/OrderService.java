package com.ebooklibrary.app.shop.order.model;

import java.util.List;
import java.util.Map;

import com.ebooklibrary.app.common.DateSearchVO;

public interface OrderService {
	public int insertOrders(List<OrderVO> orderList);
	public int MyBooksInsert(List<Map<String, Object>> cartList,List<OrderVO> orderList);
	public List<OrderVO> selectOrderAll(DateSearchVO searchVo);
	public int selectOrderCount(DateSearchVO searchVo);
	
}
