package com.ebooklibrary.app.library.notice.model;

import java.util.List;

import com.ebooklibrary.app.common.SearchVO;

public interface NoticeService {
	public int insertNotice(NoticeVO noticeVo);
	public NoticeVO selectByNoNotice(int notice_No);
	public int editNotice(NoticeVO noticeVo);
	public int deleteNotice(NoticeVO noticeVo);
	public List<NoticeVO> selectAllNotice(SearchVO searchVo);
	public int noticeCount(SearchVO searchVo);
	public int readCountAdd(int notice_No);
	public int prePageNotice(int notice_No);
	public int minPage();
	public int nextPageNotice(int notice_No);	
	public int nextPage();
	public List<NoticeVO> selectMainNotice();
}
