package com.ebooklibrary.app.shop.cart.model;

import java.util.List;
import java.util.Map;

public interface CartService {
	//장바구니에 책이 있는지 여부
	public static final int BOOK_OK=-1;
	public static final int BOOK_NO=1;
	public int insertCartPd(CartVO cartVo);
	public List<Map<String, Object>> selectCartView(String userId);
	public int updateCart(CartVO cartVo);
	public int delCart(int cartNo);
	public int deleteCart(Map<String, Object> map);
}
