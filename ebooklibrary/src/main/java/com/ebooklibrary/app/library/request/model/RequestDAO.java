package com.ebooklibrary.app.library.request.model;

import java.util.List;

import com.ebooklibrary.app.common.SearchVO;

public interface RequestDAO {
	public int insertRequest(RequestVO vo);
	public RequestVO selectByNoRequest(int requestNo);
	public int editRequest(RequestVO vo);
	public int deleteRequest(int requestNo);
	public List<RequestVO> selectAllRequest(SearchVO searchVo);
	public int requestCount(SearchVO searchVo);
	public int stockBook(int requestNo);
}
