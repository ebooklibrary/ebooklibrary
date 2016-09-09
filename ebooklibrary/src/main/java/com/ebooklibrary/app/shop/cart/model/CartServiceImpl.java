package com.ebooklibrary.app.shop.cart.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDao;

	@Override
	public int insertCartPd(CartVO cartVo) {
		int result=cartDao.selectCountCart(cartVo);
		int cnt=0;
		if(result>0){
			cnt=BOOK_OK;
		}else{
			cnt=cartDao.insertCartPd(cartVo);
		}
		return cnt;		
	}
	public List<Map<String, Object>> selectCartView(String userId){
		return cartDao.selectCartView(userId);
	}
	
	
}
