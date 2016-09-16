package com.ebooklibrary.app.memo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.common.MemoSearchVO;
import com.ebooklibrary.app.common.PaginationInfo;
import com.ebooklibrary.app.common.SearchVO;
import com.ebooklibrary.app.common.Utility;
import com.ebooklibrary.app.memo.model.MemoService;
import com.ebooklibrary.app.memo.model.MemoVO;

@Controller
@RequestMapping("/library/memo")
public class MemoController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemoController.class);
	
	@Autowired
	private MemoService memoService;
	
	@RequestMapping("/NewMemoCount.do")
	@ResponseBody
	public int newMemoCount(@RequestParam String userId){
		/*logger.info("새 쪽지 확인카운트 파라미터 userId={}",userId);*/
		int cnt= memoService.memoCount(userId);
		/*logger.info("새 쪽지 확인결과 cnt={}",cnt);*/
		return cnt;
	}
	
	@RequestMapping("/memo.do")
	public String memo(HttpSession session,@ModelAttribute MemoSearchVO searchVo,Model model){
		String userId=(String)session.getAttribute("userId");
		logger.info("메모 페이지 들어가기 userId={},searchVo={}",userId,searchVo);
		if(searchVo.getToFrom()==null){
			searchVo.setToFrom("");
		}
		searchVo.setUserId(userId);
		//toPagingInfo
		PaginationInfo toPagingInfo= new PaginationInfo();
		toPagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		toPagingInfo.setRecordCountPerPage(Utility.MEMO_COUNT_PER_PAGE);
		
		//fromPagingInfo
		PaginationInfo fromPagingInfo= new PaginationInfo();
		fromPagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		fromPagingInfo.setRecordCountPerPage(Utility.MEMO_COUNT_PER_PAGE);
		
		
		if(searchVo.getToFrom().equals("T")){
			toPagingInfo.setCurrentPage(searchVo.getCurrentPage());
		}else{
			toPagingInfo.setCurrentPage(1);
		}
		if(searchVo.getToFrom().equals("F")){
			fromPagingInfo.setCurrentPage(searchVo.getCurrentPage());
		}else{
			fromPagingInfo.setCurrentPage(1);
		}
		
		
		//searchVo
		searchVo.setRecordCountPerPage(Utility.MEMO_COUNT_PER_PAGE);
		if(searchVo.getToFrom().equals("T")){
			searchVo.setFirstRecordIndex(toPagingInfo.getFirstRecordIndex());
		}else if(searchVo.getToFrom().equals("F")){
			searchVo.setFirstRecordIndex(fromPagingInfo.getFirstRecordIndex());
		}
		
		List<MemoVO> toList=memoService.selectToId(searchVo);
		logger.info("받은 메세지 tolist={}",toList.size());
		int toTotalRecord=memoService.selectToIdCount(searchVo);
		toPagingInfo.setTotalRecord(toTotalRecord);
		
		List<MemoVO> fromList=memoService.selectFromId(searchVo);
		logger.info("보낸 메세지 fromlist={}",fromList.size());
		int fromTotalRecord=memoService.selectFromIdCount(searchVo);
		fromPagingInfo.setTotalRecord(fromTotalRecord);
		
		model.addAttribute("toList", toList);		
		model.addAttribute("fromList", fromList);
		model.addAttribute("toPagingInfo", toPagingInfo);
		model.addAttribute("fromPagingInfo", fromPagingInfo);
		return "library/memo/memoList";
	}
	
	@RequestMapping("/memoWrite.do")
	public String memoWrite(@ModelAttribute MemoVO memoVo,Model model){
		logger.info("쪽지쓰기 파라미터 memoVo={}",memoVo);
		int cnt=memoService.insertMemo(memoVo);
		logger.info("쪽지쓰기 결과 cnt={}",cnt);
		model.addAttribute("msg", "쪽지를 보냈습니다");
		model.addAttribute("url", "/library/memo/memo.do");
		
		return "common/message";
	}
	
	@RequestMapping("/memoCheck.do")
	@ResponseBody
	public void memoCheck(@RequestParam int memoNo){
		logger.info("쪽지 확인체크 파라미터 memoNo={}",memoNo);
		int cnt = memoService.updateMemoChecked(memoNo);		
	}
	
	@RequestMapping("/memoDelete.do")
	@ResponseBody
	public void memoDelete(@RequestParam int memoNo){
		logger.info("쪽지 확인체크 파라미터 memoNo={}",memoNo);
		int cnt = memoService.deleteMemo(memoNo);		
	}
	
}
