package com.ebooklibrary.app.library.notice.model;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebooklibrary.app.common.SearchVO;

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
	
	@Override
	public List<NoticeVO> selectAllNotice(SearchVO searchVo) {
		return noticedao.selectAllNotice(searchVo);
	}

	@Override
	public int noticeCount(SearchVO searchVo) {
		return noticedao.noticeCount(searchVo);
	}
	
}
