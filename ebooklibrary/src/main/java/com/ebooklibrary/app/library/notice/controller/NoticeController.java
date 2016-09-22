package com.ebooklibrary.app.library.notice.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.ebooklibrary.app.common.FileUploadWebUtil;
import com.ebooklibrary.app.common.PaginationInfo;
import com.ebooklibrary.app.common.SearchVO;
import com.ebooklibrary.app.common.Utility;
import com.ebooklibrary.app.library.notice.model.NoticeService;
import com.ebooklibrary.app.library.notice.model.NoticeVO;

@Controller
@RequestMapping("/library/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private FileUploadWebUtil fileUtil;
	
	@RequestMapping(value ="/noticewrite.do", method = RequestMethod.GET)
	public String noticeWrite_get(){
		logger.info("공지사항 입력 보여주기");
		
		return "library/notice/noticewrite";
	}
	
	@RequestMapping(value ="/noticewrite.do", method = RequestMethod.POST)
	public String noticeWrite_post(HttpServletRequest request,@ModelAttribute NoticeVO noticeVo , Model model){
		logger.info("공지사항 입력 처리");
		
		int uploadType = FileUploadWebUtil.NOTICE_UPLOAD;
		
		List<Map<String, Object>> fileList = fileUtil.fileUpload(request, uploadType);
		String fileName= "";
		String upPath="";
		long fileSize=0;
		for(Map<String, Object> mvMap :fileList){
			fileName=(String)mvMap.get("fileName");
			upPath=(String)mvMap.get("upPath");
			fileSize=(Long)mvMap.get("fileSize");
			logger.info("업로드파일 fileName={}, upPath={}",fileName,upPath);
		}
		noticeVo.setFileName(fileName);
		noticeVo.setFileSize(fileSize);
		
		int cnt = noticeService.insertNotice(noticeVo);
		String msg = "" , url ="";
		if(cnt>0){
			msg="공지사항 입력 성공";
			url="/library/notice/noticelist.do";
		}else{
			msg="공지사항 입력 실패";
			url="/library/notice/noticewrite.do";
		}
			
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/noticedetail.do")
	public String selectByNoNotice(@RequestParam (defaultValue="0")int notice_No,Model model){
		logger.info("공지사항 상세보기 파라미터 notice_No={}",notice_No);
		
		if(notice_No==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/notice/noticelist.do");
			return "common/message";
		}
		
		NoticeVO noticeVo = noticeService.selectByNoNotice(notice_No);
		int prePage=noticeService.prePageNotice(notice_No);

		int nextPage=noticeService.nextPageNotice(notice_No);
		NoticeVO preVo=noticeService.selectByNoNotice(prePage);
		logger.info("preVo={}",preVo);
		NoticeVO nextVo=noticeService.selectByNoNotice(nextPage);
		logger.info("nextVo={}",nextVo);
		logger.info("개별조회 noticeVo={}",noticeVo);
		model.addAttribute("noticeVo", noticeVo);
		model.addAttribute("preVo", preVo);
		model.addAttribute("nextVo", nextVo);
		
		return "library/notice/noticedetail";
		
	}
	
	@RequestMapping(value ="/noticeEdit.do" , method=RequestMethod.GET)
	public String editNoitce_get(@RequestParam(defaultValue="0")int notice_No , Model model){
		/*공지사항 수정 화면보여주기*/
		/*공지사항 번호 가져오기*/
		logger.info("공지사항 수정 화면 보여주기 , 파라미터 notice_No={}",notice_No);
		
		logger.info("관리자용 공지사항 수정 화면 보여주기");
		if(notice_No==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/reBoard/list.do");
			return "common/message";
		}
		
		NoticeVO noticeVo = noticeService.selectByNoNotice(notice_No);
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "library/notice/noticeEdit";
		
	}
	
	@RequestMapping(value ="/noticeEdit.do" , method=RequestMethod.POST)
	public String editNotice_post(@ModelAttribute NoticeVO noticeVo,@RequestParam String oldFileName, @RequestParam long oldFileSize, HttpServletRequest request,  Model model){ 
		logger.info("관리자용 공지사항 수정처리");
		logger.info("noticeVo={}",noticeVo);
		int uploadType = FileUploadWebUtil.NOTICE_UPLOAD;
		String fileName="";
		long fileSize =0;
		
		List<Map<String, Object>> fileList = fileUtil.fileUpload(request, uploadType);
		if(fileList!=null && !fileList.isEmpty()){
			for(Map<String, Object> fileMap : fileList){
				fileName=(String)fileMap.get("fileName");
				fileSize =(Long)fileMap.get("fileSize");
			}
			noticeVo.setFileName(fileName);
			noticeVo.setFileSize(fileSize);
			
			//기존파일이 존재하면 지곤파일 삭제
			
			String upPath = fileUtil.getUploadPath(request, uploadType);
			File oldFile = new File(upPath,oldFileName);
			if(oldFile.exists()){
				boolean bool = oldFile.delete();
				logger.info("기존파일 삭제여부 ={} ",bool);
			}
		}else{
			//업로드 하지않는 경우
			noticeVo.setFileName(fileName);
			noticeVo.setFileSize(fileSize);
		}//if
		
		int cnt = noticeService.editNotice(noticeVo);
		logger.info("수정 후 파라미터 cnt = {}",cnt);
		String msg ="" , url ="/library/notice/noticeEdit.do?notice_No="+noticeVo.getNoticeNo();
		if(cnt>0){
			msg="공지사항 수정 성공";
			url="/library/notice/noticedetail.do?notice_No="+noticeVo.getNoticeNo();
		}else{
			msg="공지사항 수정 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	@RequestMapping(value="/noticeDelete.do")
	public String deleteNotice_get(@ModelAttribute NoticeVO noticeVo,Model model){
		logger.info("관리자용 삭제 처리");
		
		
		logger.info("noticeVo={}",noticeVo);
		int cnt = noticeService.deleteNotice(noticeVo);
		String msg = "" , url = "library/notice/noticeDelete.do?notice_No="+noticeVo.getNoticeNo();
		if(cnt>0){
			msg="공지사항 삭제 성공";
			url ="/library/notice/noticelist.do";
		}else{
			msg="공지사항 삭제 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
				
		return "common/message";
	}
	
	@RequestMapping("/noticelist.do")
	public String AllNotice(@ModelAttribute SearchVO searchVo,Model model){
		logger.info("공지사항 전체보기");
		logger.info("파라미터 조회 결과 SearchVo ={}",searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.NOTICE_BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.NOTICE_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(Utility.NOTICE_COUNT_PER_PAGE);
		
		List<NoticeVO> alist = noticeService.selectAllNotice(searchVo);
		//토탈 레코드
		int result = noticeService.noticeCount(searchVo);
		pagingInfo.setTotalRecord(result);
		
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "library/notice/noticelist";
	}
	
	@RequestMapping("/readCountAdd.do")
	public String readCountAdd(@RequestParam(defaultValue="0") int notice_No){
		logger.info("조회수 증가");
		
		int result = noticeService.readCountAdd(notice_No);
		
		return "redirect:/library/notice/noticedetail.do?notice_No="+notice_No;
	}
	
	@RequestMapping("/prePage.do")
	public String prePage(@RequestParam(defaultValue="0")int notice_No , Model model){
		logger.info("이전페이지 이동처리 , 파라미터값 notice_No={}",notice_No);
		int minNotice_No =noticeService.minPage();
		logger.info("최소값 minNotice_No = {}" , minNotice_No);
		
		if(notice_No==minNotice_No){
			String msg= "첫번째 글입니다";
			String url ="/library/notice/noticedetail.do?notice_No="+notice_No;
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
		
		int preNotice_No=noticeService.prePageNotice(notice_No);
		
		return "redirect:/library/notice/noticedetail.do?notice_No="+preNotice_No;
		
	}
	
	@RequestMapping("/nextPage.do")
	public String nextPage(@RequestParam(defaultValue="0") int notice_No,Model model){
		
		logger.info("다음페이지 이동처리 , 파라미터 값 notice_No={}",notice_No);
		int maxNotice_No = noticeService.nextPage();
		
		if(notice_No==maxNotice_No){
			String msg = "마지막 글입니다";
			String url = "/library/notice/noticedetail.do?notice_No="+notice_No;
			model.addAttribute("msg", msg);
			model.addAttribute("url",url);
				
			return "common/message";
		}
		
		int nextNotice_No = noticeService.nextPageNotice(notice_No);
		
		return "redirect:/library/notice/noticedetail.do?notice_No="+nextNotice_No;
	}
	
	@RequestMapping("/mainNotice.do")
	public String mainNotice(Model model){
		logger.info("메인 공지사항 띄우기");
		List<NoticeVO> noticeVo=noticeService.selectMainNotice();
		
		model.addAttribute("noticeVo", noticeVo);
		return "library/mainInclude/tab1";
	}
	
}
