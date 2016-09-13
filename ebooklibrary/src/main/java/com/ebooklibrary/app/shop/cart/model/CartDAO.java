package com.ebooklibrary.app.shop.cart.model;

import java.util.List;
import java.util.Map;

public interface CartDAO {
	public int selectCountCart(CartVO cartVo);
	public int insertCartPd(CartVO cartVo);
	public List<Map<String, Object>> selectCartView(String userId);
}