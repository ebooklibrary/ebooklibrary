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
	
	
	@RequestMapping(value="/faqWrite.do",method=RequestMethod.GET)
	public String faqWrite(){
		logger.info("faq 글쓰기 화면 페이지");
		
		return "library/serviceCenter/faq/faqWrite";
	}
	
	@RequestMapping(value="/faqWrite.do",method=RequestMethod.POST)
	public String faqWrite(@ModelAttribute FaqVO faqVo){
		logger.info("faq 글쓰기 처리 페이지 입력 파라미터값 faqVo={}",faqVo);
		
		int cnt= faqService.insertFaqBoard(faqVo);
		
		
		
		return "";
	}
	
	/*@RequestMapping("/faqList.do")
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
		
		List<QnaBoardVO> alist=faqService.selectQnaAll(searchVo);
		logger.info("결과처리값 alist.size()={}",alist.size());
		
		model.addAttribute("faqList",alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		
		return "library/faq/faqlist";
	}
	*/
	
	
}