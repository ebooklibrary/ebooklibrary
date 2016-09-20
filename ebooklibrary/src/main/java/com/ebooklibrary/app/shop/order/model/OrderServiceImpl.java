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
	public int insertOrders(OrderVO orderVo) {
		//주문 처리
		//[1] orders 테이블에 insert
		int cnt = orderDao.insertOrders(orderVo);
		logger.info("orders insert 결과, cnt={}",cnt);
		
		//[2] orderDetails 테이블에 insert
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", orderVo.getUserId());
		map.put("orderNo", orderVo.getOrderNo());
				
		cnt = orderDao.insertOrderDetails(map);
		logger.info("orderDetails insert 결과, cnt={}",cnt);
		
		//[3] cart 테이블에서 delete
		cnt 
		= orderDao.deleteCartByUserid(orderVo.getUserId());
		logger.info("주문 처리-cart delete 결과, cnt={}",cnt);
		
		return cnt;
	}
	
	@Override
	@Transactional
	public int MyBooksInsert(List<Map<String, Object>> cartList){
		int cnt=0;		
		for(int i=0;i<cartList.size();i++){
			Map<String, Object> map=cartList.get(i);			
			cnt=orderDao.insertMyBooks(map);
			cnt=cartDao.deleteCart(map);
			
		}
		return cnt;
	}

}

