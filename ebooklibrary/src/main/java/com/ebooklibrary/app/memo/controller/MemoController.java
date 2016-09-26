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
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.memo.model.MemoService;
import com.ebooklibrary.app.memo.model.MemoVO;

@Controller
@RequestMapping("/library/memo")
public class MemoController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemoController.class);
	
	@Autowired
	private MemoService memoService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/NewMemoCount.do")
	@ResponseBody
	public int newMemoCount(@RequestParam String userId){
		/*logger.info("새 쪽지 확인카운트 파라미터 userId={}",userId);*/
		int cnt= memoService.memoCount(userId);
		/*logger.info("새 쪽지 확인결과 cnt={}",cnt);*/
		return cnt;
	}
	
	@RequestMapping("/memoWrite.do")
	public String memoWrite(@ModelAttribute MemoVO memoVo,Model model){
		logger.info("쪽지쓰기 파라미터 memoVo={}",memoVo);
		int cnt=memoService.insertMemo(memoVo);
		logger.info("쪽지쓰기 결과 cnt={}",cnt);
		model.addAttribute("msg", "쪽지를 보냈습니다");
		model.addAttribute("url", "/library/memo/fromMemo.do");
		
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
			
	@RequestMapping("/toMemo.do")
	public String toMemo(@ModelAttribute MemoSearchVO searchVo
			,HttpSession session,Model model){
		
		String userId=(String)session.getAttribute("userId");
		searchVo.setUserId(userId);
		logger.info("받은 쪽지함 searchVo={}",searchVo);
		//PagingInfo
		PaginationInfo pagingInfo= new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.MEMO_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//searchVo
		searchVo.setRecordCountPerPage(Utility.MEMO_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		logger.info("FirstRecordIndex()={}"+pagingInfo.getFirstRecordIndex());
		
		List<MemoVO> toList=memoService.selectToId(searchVo);
		logger.info("받은쪽지 toList={}",toList.size());
		int totalRecord=memoService.selectToIdCount(searchVo);
		logger.info("totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("getFirstPage={}",pagingInfo.getFirstPage());
		logger.info("getLastPage={}",pagingInfo.getLastPage());
				
		model.addAttribute("ToFrom", "T");				
		model.addAttribute("toList", toList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "library/memo/memoList2";
	}
	
	@RequestMapping("/fromMemo.do")
	public String fromMemo(@ModelAttribute MemoSearchVO searchVo
			,HttpSession session,Model model){
		
		String userId=(String)session.getAttribute("userId");
		searchVo.setUserId(userId);
		logger.info("보낸 쪽지함 searchVo={}",searchVo);
		//PagingInfo
		PaginationInfo pagingInfo= new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.MEMO_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//searchVo
		searchVo.setRecordCountPerPage(Utility.MEMO_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<MemoVO> fromList=memoService.selectFromId(searchVo);
		logger.info("보낸 쪽지 fromList={}",fromList.size());
		int totalRecord=memoService.selectFromIdCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("ToFrom", "F");
		model.addAttribute("fromList", fromList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "library/memo/memoList2";
	}
	
	@RequestMapping("/memoMemberCheck.do")
	@ResponseBody
	public int memoMemberCheck(@RequestParam String userId){
		logger.info("쪽지보내기 유저확인 userId={}",userId);
		int cnt=memberService.selectMemberCheckId(userId);
		logger.info("유저확인 결과 cnt={}",cnt);
		return cnt;
	}
}
