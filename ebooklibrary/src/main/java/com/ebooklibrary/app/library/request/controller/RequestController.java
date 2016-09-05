package com.ebooklibrary.app.library.request.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ebooklibrary.app.common.PaginationInfo;
import com.ebooklibrary.app.common.SearchVO;
import com.ebooklibrary.app.common.Utility;
import com.ebooklibrary.app.library.qna.controller.QnAController;
import com.ebooklibrary.app.library.qna.model.QnaBoardService;
import com.ebooklibrary.app.library.qna.model.QnaBoardVO;
import com.ebooklibrary.app.library.request.model.RequestService;
import com.ebooklibrary.app.library.request.model.RequestVO;

@Controller
@RequestMapping("/library/request")
public class RequestController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(QnAController.class);
	
	@Autowired
	private RequestService requestService;
	
	@RequestMapping("/requestList.do")
	public String listQnaBoard(
			@ModelAttribute SearchVO searchVo,
			Model model){
		//1.
		logger.info("요청게시판 리스트 ");
		
		//paging
		PaginationInfo pagingInfo= new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.REQUEST_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//searchVo
		searchVo.setRecordCountPerPage(Utility.REQUEST_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//2.
		int totalRecord=requestService.requestCount(searchVo);
		logger.info("요청게시판  searchVo={}",searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<RequestVO> alist=requestService.selectAllRequest(searchVo);
		logger.info("결과처리값 alist.size()={}",alist.size());
		
		model.addAttribute("requestList",alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "library/request/requestList";		
	}
	
	@RequestMapping(value="/requestWrite.do", method=RequestMethod.GET)
	public String QnaBoardWrite_get(){
		
		logger.info("Qna 글쓰기폼");
		return	"library/request/requestwrite";
	}	
	@RequestMapping(value="/requestWrite.do", method=RequestMethod.POST)
	public String QnaBoardWrite_post(@ModelAttribute RequestVO vo,Model model){
		logger.info("Qna 글쓰기 처리페이지, 입력값 RequestVO={} ", vo);
		
		int cnt = requestService.insertRequest(vo);
		
		String msg="",url="/library/request/requestWrite.do";
		
		if(cnt>0){
			msg="글작성 성공";			
			url="/library/request/requestList.do";
		}else{
			msg="글 작성 실패";
			
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/requestDetail.do") 
	public String QnaBoardDetail(@RequestParam(defaultValue="0") 
	int requestNo,Model model){
		logger.info("디테일 페이지 접속 입력값  QnaNo={}", requestNo);
		
		RequestVO vo = requestService.selectByNoRequest(requestNo);
		
		logger.info("결과값은 qnaBoardVo={}",vo);
		
		model.addAttribute("requestVo",vo);
		
		return "library/request/requestDetail";
		
	}
	
	@RequestMapping(value="/requestEdit.do",method=RequestMethod.GET)
	public String QnaBoardEdit(@RequestParam(defaultValue="0") int requestNo,Model model){
		logger.info("수정 페이지 접속 파라미터 입력값 qnaNo={}",requestNo);
		
		RequestVO vo = requestService.selectByNoRequest(requestNo);
		
		logger.info("수정페이지 입력 파라미터값 qnaBoardVo={}",vo);
		
		model.addAttribute("requestVo",vo);		
		
		return "library/request/requestEdit";
	}
	
	@RequestMapping(value="/requestEdit.do",method=RequestMethod.POST)
	public String QnaBoardEdit(
			@ModelAttribute RequestVO vo,
			Model model){
		
		//1.
		logger.info("수정 페이지 수정처리 파라미터 vo={}",vo);
		
		//2.
		int cnt = requestService.editRequest(vo);
		logger.info("결과값 cnt={}",cnt);
		
		String msg="",url="/library/request/requestEdit.do?requestNo="+vo.getRequestNo();
		if(cnt>0){
			msg="글 수정 성공";
			url="/library/request/requestDetail.do?requestNo="+vo.getRequestNo();
		}else{
			msg="글 수정 실패";
		}
		
		//3.
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/requestDelete.do",method=RequestMethod.GET)
	public String QnaBoardDelete(@RequestParam(defaultValue="0") int requestNo){
		//1.
		
		
		logger.info("삭제 페이지 보여주기");
		
		//2.
		
		
		//3.
		
		return "library/request/requestDelete";
	}
	
	@RequestMapping(value="/requestDelete.do",method=RequestMethod.POST)
	public String QnaBoardDelete(@RequestParam(defaultValue="0") int requestNo
			,Model model){

		//1.
		logger.info("삭제 처리하기 requestNo={}",requestNo);
		
		//2.
		int cnt = requestService.deleteRequest(requestNo);
		logger.info("삭제 결과처리값 cnt={}",cnt);	
		
		String msg="",url="/library/request/requestDetail.do?requestNo="+requestNo;
		if(cnt>0){
			msg="삭제 되었습니다.";
			url="/library/request/requestList.do";
		}else{
			msg="삭제에 실패했습니다.";
		}
		
		
		//3.
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/requestSelectByMem.do")
	public String selectByMemberNo(){
		//1.
		
		//2.
		
		//3.
		
		return "common/message";
	}
	
	
	
	
}
