package com.ebooklibrary.app.library.ServiceCenter.Faq.controller;

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

import com.ebooklibrary.app.common.MemberSearchVO;
import com.ebooklibrary.app.common.PaginationInfo;
import com.ebooklibrary.app.common.SearchVO;
import com.ebooklibrary.app.common.Utility;
import com.ebooklibrary.app.library.ServiceCenter.Faq.model.FaqService;
import com.ebooklibrary.app.library.ServiceCenter.Faq.model.FaqVO;
import com.ebooklibrary.app.library.qna.model.QnaBoardVO;

@Controller
@RequestMapping("/library/serviceCenter/faq")
public class FaqController {
	private static final Logger logger
	=LoggerFactory.getLogger(FaqController.class);
		
	@Autowired
	private FaqService faqService;
	
	
	@RequestMapping("/bestFaq.do")
	public String bestFaqList(@ModelAttribute SearchVO searchVo,
			Model model){
		//1.
		logger.info("Faq 리스트 ");
		logger.info("searchVO={}",searchVo);
		
				
		//2.
		logger.info("키워드 전 키워드값 ");
			
		List<FaqVO> alist=faqService.fixedList();
		logger.info("결과처리값 alist.size()={}",alist.size());
		
		model.addAttribute("bestFAQ",alist);
		
		
		
		return "library/serviceCenter/faq/bestFaq";
	}
	
	
	
	@RequestMapping("/faqDetail.do") 
	public String faqDetail(@RequestParam(defaultValue="0") int faqNo,Model model){
		//1.
		logger.info("디테일 페이지 접속 입력값  faqaNo={}", faqNo);
		//2.
		FaqVO faqVo = faqService.selectByNo(faqNo);
		logger.info("결과값은 faqVo={}",faqVo);
		
		//3.
		model.addAttribute("faqDetail",faqVo);
		
		return "library/serviceCenter/faq/faqDetail";
		
	}
	
	@RequestMapping(value="/faqEdit.do",method=RequestMethod.GET)
	public String faqEdit(@RequestParam(defaultValue="0")int faqNo, Model model){
		//1.
		logger.info("faq수정페이지 접속 파라미터 faqNo={}",faqNo);
		//2.
		FaqVO faqVo= faqService.selectByNo(faqNo);
		//3.
		model.addAttribute("faqDetail",faqVo);
		
		
		return "library/serviceCenter/faq/faqEdit";
	}
	
	@RequestMapping(value="/faqEdit.do",method=RequestMethod.POST)
	public String faqEdit(@ModelAttribute FaqVO faqVo,
			Model model){
		
		//1.
		logger.info("faq수정처리페이지 파라미터값 faqVo={} ",faqVo);

		//2.
		int cnt = faqService.faqEdit(faqVo);
		logger.info("결과값 cnt={}",cnt);
		
		//3.
		String msg="",url="/library/serviceCenter/faq/faqEdit.do?qnaNo="+faqVo.getFaqNo();
		if(cnt>0){
			msg="글 수정 성공";
			url="/library/serviceCenter/faq/faqDetail.do?faqNo="+faqVo.getFaqNo();
		}else{
			msg="글 수정 실패";
		}
		
		//3.
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}	
	
	@RequestMapping("/faqDelete.do")
	public String faqDelet(@RequestParam(defaultValue="0") int faqNo,Model model){
		//1.
		logger.info("삭제 처리 페이지 파라미터값 faqNo={}",faqNo);
		
		//2.
		int cnt= faqService.faqDelete(faqNo);
		logger.info("삭제처리 결과값 cnt={}",cnt);
		
		//3.
		String msg="",url="/library/serviceCenter/faq/faqDetail.do?faqNo="+faqNo;
		if(cnt>0){
			msg="삭제 되었습니다.";
			url="/library/serviceCenter/faq/faqList.do";
		}else{
			msg="삭제에 실패했습니다.";
		}
		
		
		return "common/message";
	}
	
	@RequestMapping("faqfixed.do")
	public String faqFixed(@RequestParam(defaultValue="0")int faqNo){
		//1.
		logger.info("고정처리 페이지 파라미터값 faqNo={}",faqNo);
		
		//2.
		int cnt = faqService.fixedByNo(faqNo);
		logger.info("고정글 처리 결과값 cnt={}",cnt);

		//3.
		String msg="",url="/library/serviceCenter/faq/faqDetail.do?faqNo="+faqNo;
		if(cnt>0){
			msg="처리 되었습니다.";
			url="/library/serviceCenter/faq/faqList.do";
		}else{
			msg="처리에 실패했습니다.";
		}
		
		return "common/message";
		
	}
	
	@RequestMapping("/faqList.do")
	public String faqList(@ModelAttribute SearchVO searchVo,
			Model model){
		//1.
		logger.info("Faq 리스트 ");
		logger.info("searchVO={}",searchVo);
		
		//paging
		PaginationInfo pagingInfo= new PaginationInfo();
		pagingInfo.setBlockSize(Utility.FAQ_BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.FAQ_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//searchVo
		searchVo.setRecordCountPerPage(Utility.FAQ_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//2.
		logger.info("키워드 전 키워드값 ");
		int totalRecord=faqService.selectListCount(searchVo);
		logger.info("키워드 후 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<FaqVO> alist=faqService.selectFaqAll(searchVo);
		logger.info("결과처리값 alist.size()={}",alist.size());
		
		model.addAttribute("faqList",alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		
		return "library/serviceCenter/faq/faqList";
	}
	
}
