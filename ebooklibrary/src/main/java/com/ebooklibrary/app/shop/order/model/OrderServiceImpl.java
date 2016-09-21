package com.ebooklibrary.app.shop.order.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ebooklibrary.app.shop.cart.model.CartDAO;

@Service
public class OrderServiceImpl implements OrderService{
	private static final Logger logger
	=LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private OrderDAO orderDao;
	
	@Autowired
	private CartDAO cartDao;
	
	@Override
	@Transactional
	public int insertOrders(List<OrderVO> orderList) {
		int cnt=0;
		for(int i=0;i<orderList.size();i++){
			
		}
		return cnt;
	}
	
	@Override
	@Transactional
	public int MyBooksInsert(List<Map<String, Object>> cartList,List<OrderVO> orderList){
		int cnt=0;		
		for(int i=0;i<cartList.size();i++){
			Map<String, Object> map=cartList.get(i);			
			cnt=orderDao.insertMyBooks(map);
			cnt=cartDao.deleteCart(map);	
			OrderVO orderVo=orderList.get(i);
			cnt=orderDao.insertOrders(orderVo);
		}
		return cnt;
	}

}

