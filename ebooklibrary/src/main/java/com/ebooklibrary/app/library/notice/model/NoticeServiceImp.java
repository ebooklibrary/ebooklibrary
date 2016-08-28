package com.ebooklibrary.app.library.notice.model;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImp implements NoticeService{
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImp.class);
	
	@Autowired
	private NoticeDAO noticedao;
	
	public int insertNotice(NoticeVO noticeVo){
		return noticedao.insertNotice(noticeVo);
	}

	@Override
	public NoticeVO selectByNoNotice(int notice_No) {
		return noticedao.selectByNoNotice(notice_No);
	}

	@Override
	public int editNotice(NoticeVO noticeVo) {
		return noticedao.editNotice(noticeVo);
	}

	@Override
	public int deleteNotice(NoticeVO noticeVo) {
		return noticedao.deleteNotice(noticeVo);
	}
	
}
