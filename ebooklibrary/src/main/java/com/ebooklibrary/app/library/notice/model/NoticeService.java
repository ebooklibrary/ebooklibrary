package com.ebooklibrary.app.library.notice.model;

public interface NoticeService {
	public int insertNotice(NoticeVO noticeVo);
	public NoticeVO selectByNoNotice(int notice_No);
	public int editNotice(NoticeVO noticeVo);
	public int deleteNotice(NoticeVO noticeVo);
}
