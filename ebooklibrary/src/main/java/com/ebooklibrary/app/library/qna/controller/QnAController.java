package com.ebooklibrary.app.library.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
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
import com.ebooklibrary.app.library.qna.model.QnaBoardService;
import com.ebooklibrary.app.library.qna.model.QnaBoardVO;

@Controller
@RequestMapping("/library/qna")
public class QnAController {
	private static final Logger logger
	= LoggerFactory.getLogger(QnAController.class);
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@RequestMapping("/qnaList.do")
	public String listQnaBoard(
			@ModelAttribute SearchVO searchVo,
			Model model){
		//1.
		logger.info("Qna 리스트 ");
		
		//paging
		PaginationInfo pagingInfo= new PaginationInfo();
		pagingInfo.setBlockSize(Utility.QNA_BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//searchVo
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//2.
		logger.info("키워드 전 키워드값 ");
		int totalRecord=qnaBoardService.selectListCount(searchVo);
		logger.info("키워드 후 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<QnaBoardVO> alist=qnaBoardService.selectQnaAll(searchVo);
		logger.info("결과처리값 alist.size()={}",alist.size());
		
		model.addAttribute("qnaList",alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		
		return "library/qna/qnalist";
	}
	
	@RequestMapping(value="/qnaWrite.do", method=RequestMethod.GET)
	public String QnaBoardWrite_get(){
		
		logger.info("Qna 글쓰기폼");
		return	"library/qna/qnawrite";
	}
	
	@RequestMapping(value="/qnaWrite.do", method=RequestMethod.POST)
	public String QnaBoardWrite_post(@ModelAttribute QnaBoardVO qnaBoardVo,Model model){
		logger.info("Qna 글쓰기 처리페이지, 입력값 qnaBoardVo={} ", qnaBoardVo);
		
		int cnt = qnaBoardService.insertQnaBoard(qnaBoardVo);
		
		String msg="",url="/library/qna/qnaWrite.do";
		
		if(cnt>0){
			msg="글작성 성공";
			int qnaBoardNo=qnaBoardService.selectQnaBoardByUsername(qnaBoardVo.getWriter());
			logger.info("마지막 글번호 추출  qnaBoardNo={}",qnaBoardNo);
			
			url="/library/qna/qnaDetail.do?qnaNo="+qnaBoardNo;
		}else{
			msg="글 작성 실패";
			
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/qnaDetail.do") 
	public String QnaBoardDetail(@RequestParam(defaultValue="0") int qnaNo,Model model){
		logger.info("디테일 페이지 접속 입력값  QnaNo={}", qnaNo);
		
		QnaBoardVO qnaBoardVo = qnaBoardService.selectByNo(qnaNo);
		
		logger.info("결과값은 qnaBoardVo={}",qnaBoardVo);
		
		model.addAttribute("qnaBoardVo",qnaBoardVo);
		
		return "library/qna/qnaDetail";
		
	}
	
	@RequestMapping(value="/qnaEdit.do",method=RequestMethod.GET)
	public String QnaBoardEdit(@RequestParam(defaultValue="0") int qnaNo,Model model){
		logger.info("수정 페이지 접속 파라미터 입력값 qnaNo={}",qnaNo);
		
		QnaBoardVO qnaBoardVo = qnaBoardService.selectByNo(qnaNo);
		
		logger.info("수정페이지 입력 파라미터값 qnaBoardVo={}",qnaBoardVo);
		
		model.addAttribute("qnaBoardVo",qnaBoardVo);
		
		
		return "library/qna/qnaEdit";
	}
	
	@RequestMapping(value="/qnaEdit.do",method=RequestMethod.POST)
	public String QnaBoardEdit(
			@ModelAttribute QnaBoardVO qnaBoardVo,
			Model model){
		
		//1.
		logger.info("수정 페이지 수정처리 파라미터 qnaBoardVo={}",qnaBoardVo);
		
		//2.
		int cnt = qnaBoardService.qnaBoardEdit(qnaBoardVo);
		logger.info("결과값 cnt={}",cnt);
		
		String msg="",url="/library/qna/qnaEdit.do?qnaNo="+qnaBoardVo.getQnaNo();
		if(cnt>0){
			msg="글 수정 성공";
			url="/library/qna/qnaDetail.do?qnaNo="+qnaBoardVo.getQnaNo();
		}else{
			msg="글 수정 실패";
		}
		
		//3.
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/qnaDelete.do",method=RequestMethod.GET)
	public String QnaBoardDelete(@RequestParam(defaultValue="0") int qnaNo){
		//1.
		
		
		logger.info("삭제 페이지 보여주기");
		
		//2.
		
		
		//3.
		
		return "library/qna/qnaDelete";
	}
	
	@RequestMapping(value="/qnaDelete.do",method=RequestMethod.POST)
	public String QnaBoardDelete(@RequestParam(defaultValue="0") int qnaNo,Model model){

		//1.
		logger.info("삭제 처리하기");
		
		//2.
		int cnt = qnaBoardService.qnaBoardDelete(qnaNo);
		logger.info("삭제 결과처리값 cnt={}",cnt);	
		
		String msg="",url="/library/qna/qnaDetail.do?qnaNo="+qnaNo;
		if(cnt>0){
			msg="삭제 되었습니다.";
			url="/library/qna/qnaList.do";
		}else{
			msg="삭제에 실패했습니다.";
		}
		
		
		//3.
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/readCountAdd.do")
	public String readCountAdd(@RequestParam(defaultValue="0") int qnaNo){
		//1.
		logger.info("조회수 증가처리");
		
		//2.
		qnaBoardService.readCountAdd(qnaNo);
		
		//3.
				
		return "redirect:/library/qna/qnaDetail.do?qnaNo="+qnaNo;
	}
	
	@RequestMapping("/prePage.do")
	public String prePage(@RequestParam(defaultValue="0") int qnaNo,Model model){
		//1.
		logger.info("이전페이지 이동 처리, 파라미터값 qnaNo={}",qnaNo);
		int minQnaNo= qnaBoardService.minQnaNo();
		logger.info("결과 최소값 QnaNo={}",minQnaNo);
		
		if(qnaNo==minQnaNo){
			String msg="첫번째 글입니다";
			String url="/library/qna/qnaDetail.do?qnaNo="+qnaNo;
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
		
		//2.
		int preQnaNo= qnaBoardService.prePageMove(qnaNo);
		logger.info("결과값 preQnaNo={}",preQnaNo);
		
		
		
		//3.
		return "redirect:/library/qna/qnaDetail.do?qnaNo="+preQnaNo;
	}
	
	@RequestMapping("/nextPage.do")
	public String nextPage(@RequestParam(defaultValue="0") int qnaNo,Model model){
		//1.
		logger.info("다음페이지 이동 처리, 파라미터값 qnaNo={}",qnaNo);
		int maxQnaNo= qnaBoardService.maxQnaNo();
		logger.info("결과 최대값 QnaNo={}",maxQnaNo);
		
		if(qnaNo==maxQnaNo){
			String msg="마지막 글입니다";
			String url="/library/qna/qnaDetail.do?qnaNo="+qnaNo;
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
		
		//2.
		int nextQnaNo= qnaBoardService.nextPageMove(qnaNo);
		logger.info("결과값 nextQnaNo={}",nextQnaNo);
		
		//3.
		
		return "redirect:/library/qna/qnaDetail.do?qnaNo="+nextQnaNo;
		
	}
	
	@RequestMapping("/selectByMem.do")
	public String selectByMemberNo(){
		//1.
		
		//2.
		
		//3.
		
		return "common/message";
	}
	
	
	
	
	
}
