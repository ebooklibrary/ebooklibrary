package com.ebooklibrary.app.library.request.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebooklibrary.app.common.SearchVO;

@Service
public class RequestServiceImpl implements RequestService{
	
	@Autowired
	private RequestDAO requestDao;
	
	public int insertRequest(RequestVO vo){
		return requestDao.insertRequest(vo);
	}
	
	public RequestVO selectByNoRequest(int requestNo){
		return requestDao.selectByNoRequest(requestNo);
	}
	
	public int editRequest(RequestVO vo){
		return requestDao.editRequest(vo);
	}
	
	public int deleteRequest(int requestNo){
		return requestDao.deleteRequest(requestNo);
	}
	public List<RequestVO> selectAllRequest(SearchVO searchVo){
		return requestDao.selectAllRequest(searchVo);
	}
	public int requestCount(SearchVO searchVo){
		return requestDao.requestCount(searchVo);
	}

	@Override
	public int stockBook(int requestNo) {
		return requestDao.stockBook(requestNo);
	}
}
