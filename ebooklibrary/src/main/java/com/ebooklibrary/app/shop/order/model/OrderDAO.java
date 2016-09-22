package com.ebooklibrary.app.shop.order.model;

import java.util.List;
import java.util.Map;

import com.ebooklibrary.app.common.DateSearchVO;
import com.ebooklibrary.app.shop.cart.model.CartVO;

public interface OrderDAO {
	public int insertOrders(OrderVO orderVo);
	public int insertOrderDetails(Map<String, Object> map);
	public int deleteCartByUserid(String userid);
	public int insertMyBooks(Map<String, Object> map);
	public List<OrderVO> selectOrderAll(DateSearchVO searchVo);
	public int selectOrderCount(DateSearchVO searchVo);
	public int updateBookSales(int bookNo);
	
	
}
