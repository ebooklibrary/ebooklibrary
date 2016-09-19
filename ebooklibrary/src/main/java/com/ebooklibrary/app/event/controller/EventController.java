package com.ebooklibrary.app.event.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ebooklibrary.app.common.FileUploadWebUtil;
import com.ebooklibrary.app.event.model.EventService;
import com.ebooklibrary.app.event.model.EventVO;

@Controller
@RequestMapping("/event")
public class EventController {
	private static final Logger logger=
			LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private FileUploadWebUtil fileUti;
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value="/eventWrite.do",method=RequestMethod.GET)
	public String eventWrite_get(){
		logger.info("이벤트 등록창");
		return "admin/event/eventWrite";
	}
	
	@RequestMapping(value="/eventWrite.do",method=RequestMethod.POST)
	public String eventWrite_get(@ModelAttribute EventVO eventVo
			,HttpServletRequest request,Model model){
		logger.info("이벤트 등록창 파라미터 eventVo={}",eventVo);

		//파일 업로드 처리
		int uploadType=FileUploadWebUtil.EVENTIMAGE_UPLOAD;
		//=> 상품등록시 이미지 업로드
		
		List<Map<String, Object>> fileList
		=fileUti.fileUpload(request, uploadType);
		logger.info("업로드 파일 Lis.size()={}", 
				fileList.size());
		
		//업로드된 파일명 구해오기
		String fileName="";
		long fileSize=0;
		for(Map<String, Object> mymap : fileList){
			fileName= (String) mymap.get("fileName");
			fileSize=(Long) mymap.get("fileSize");			
		}
		
		eventVo.setEventImageUrl(fileName);
		
		//2.
		int cnt = eventService.insertEvent(eventVo);
		logger.info("상품 등록 결과 cnt={}", cnt);
		
		if(cnt>0){
			model.addAttribute("msg", "이벤트 등록 성공");
		}else{
			model.addAttribute("msg", "이벤트 등록 실패");
		}
		model.addAttribute("url", "/event/eventWrite.do");
		return "common/message";
	}
	
	@RequestMapping("/mainEvent.do")
	public String selectEvent(HttpServletRequest request,Model model){
		logger.info("메인이벤트 페이지 보여주기");
		List<EventVO> alist=eventService.selectEvent(eventService.MAIN_EVENT);
		logger.info("메인이벤트 페이지 alist={}",alist.size());
		String path=fileUti.getUploadPath(request, FileUploadWebUtil.EVENTIMAGE_UPLOAD);
		
		model.addAttribute("alist", alist);
		model.addAttribute("path", path);
		return "library/mainInclude/month_book";
	}
	
	@RequestMapping("/sideEvent.do")
	public String selectSideEvent(HttpServletRequest request,Model model){
		logger.info("사이드이벤트 페이지 보여주기");
		List<EventVO> recommandList=eventService.selectEvent(eventService.RECOMMAND_EVENT);
		List<EventVO> bestList=eventService.selectEvent(eventService.BEST_EVENT);
		logger.info("추천이벤트 페이지 alist={}",recommandList.size());
		logger.info("베스트이벤트 페이지 alist={}",bestList.size());
		String path=fileUti.getUploadPath(request, FileUploadWebUtil.EVENTIMAGE_UPLOAD);
		
		model.addAttribute("recommandList", recommandList);
		model.addAttribute("alist3", bestList);
		model.addAttribute("path", path);
		return "library/libraryAd";
	}
}
