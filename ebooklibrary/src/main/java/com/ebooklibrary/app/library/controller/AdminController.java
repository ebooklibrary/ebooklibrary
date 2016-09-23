package com.ebooklibrary.app.library.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebooklibrary.app.common.FileUploadWebUtil;
import com.ebooklibrary.app.common.MemberSearchVO;
import com.ebooklibrary.app.common.PaginationInfo;
import com.ebooklibrary.app.common.PoiExcelSave;
import com.ebooklibrary.app.common.SearchVO;
import com.ebooklibrary.app.common.Utility;
import com.ebooklibrary.app.library.notice.model.NoticeService;
import com.ebooklibrary.app.library.notice.model.NoticeVO;
import com.ebooklibrary.app.library.request.model.RequestService;
import com.ebooklibrary.app.library.request.model.RequestVO;
import com.ebooklibrary.app.member.model.MemberService;
import com.ebooklibrary.app.member.model.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private PoiExcelSave poiExcelSave;
	@Autowired
	private RequestService requestService;
	@Autowired
	private NoticeService noticeService;	
	@Autowired
	private FileUploadWebUtil fileUtil;
	
	@RequestMapping("/adminMain.do")
	public String adminMain(){
		return "admin/adminMain";
	}
	
	@RequestMapping(value="/login/adminLogin.do",method=RequestMethod.GET)
	public void login_get(){
		logger.info("관리자 로그인화면 보여주기");		
	}
	
	@RequestMapping(value="/login/adminLogin.do",method=RequestMethod.POST)
	public String login_post(@ModelAttribute MemberVO vo,
			HttpServletRequest request,HttpServletResponse response
			,Model model){
		logger.info("관리자 로그인 memberVo={}",vo);
		int result=memberService.logincheck(vo);
		String msg="",url="/admin/login/adminLogin.do";
		if(result==MemberService.LOGIN_OK){
			MemberVO memberVo=memberService.selectByUserName(vo.getUserId());
			HttpSession session=request.getSession();
			session.setAttribute("adminUserId", memberVo.getUserId());
			session.setAttribute("adminAuchCode", memberVo.getAuthCode());
			session.setAttribute("adminMemberNo", memberVo.getMemberNo());
			msg=memberVo.getUserName()+"관리자님 로그인하였습니다";
			url="/admin/adminMain.do";
			
		}else if(result==memberService.PWD_DISAGREE){
			msg="비밀번호가 다릅니다";
		}else if(result==memberService.ID_NONE){
			msg="아이디가 없습니다";
		}else{
			msg="로그인 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String memberLogout(HttpSession session,Model model){
		session.removeAttribute("adminUserId");
		session.removeAttribute("adminAuchCode");
		session.removeAttribute("adminMemberNo");
		model.addAttribute("msg", "로그아웃 되었습니다");
		model.addAttribute("url", "/admin/login/adminLogin.do");
		return "common/message";
	}
	
	@RequestMapping("/member/memberList.do")
	public String adminMemberList(@ModelAttribute SearchVO searchVo,Model model){
		//1.
		//[1] pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.MEMBER_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] searchVo
		searchVo.setBlockSize(Utility.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(Utility.MEMBER_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		logger.info("회원정보 보기 searchVo={}",searchVo);
		//2.
		List<MemberVO> alist=memberService.selectMemberAll(searchVo);
		int totalRecord=memberService.selectMemberCount(searchVo);
		
		pagingInfo.setTotalRecord(totalRecord);
		//3.
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/member/memberList";
	}
	@RequestMapping("/member/memberSave.do")
	@ResponseBody
	public int memberExcelSave(){ 
		logger.info("회원정보 엑셀저장");
		MemberSearchVO vo=new MemberSearchVO();
		
		//[2] searchVo
		vo.setBlockSize(Utility.BLOCK_SIZE);
		vo.setRecordCountPerPage(Utility.MEMBER_COUNT_PER_PAGE);
		vo.setFirstRecordIndex(0);
		
		int result=poiExcelSave.excel(vo);
		logger.info("엑셀 저장 결과 result={}",result);
		
		return result;
	}
	//요청게시판
	@RequestMapping("/requestList.do")
	public String listQnaBoard(
			@ModelAttribute MemberSearchVO searchVo,
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
		
		return "admin/board/requestList";		
	}
	
	//공지사항
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
		
		return "admin/board/noticelist";
	}
	
	@RequestMapping("/noticedetail.do")
	public String selectByNoNotice(@RequestParam (defaultValue="0")int notice_No,Model model){
		logger.info("공지사항 상세보기 파라미터 notice_No={}",notice_No);
		
		if(notice_No==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/admin/noticelist.do");
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
		
		return "admin/board/noticedetail";
		
	}
	
	@RequestMapping("/readCountAdd.do")
	public String readCountAdd(@RequestParam(defaultValue="0") int notice_No){
		logger.info("조회수 증가");
		
		int result = noticeService.readCountAdd(notice_No);
		
		return "redirect:/admin/noticedetail.do?notice_No="+notice_No;
	}
	
	@RequestMapping("/prePage.do")
	public String prePage(@RequestParam(defaultValue="0")int notice_No , Model model){
		logger.info("이전페이지 이동처리 , 파라미터값 notice_No={}",notice_No);
		int minNotice_No =noticeService.minPage();
		logger.info("최소값 minNotice_No = {}" , minNotice_No);
		
		if(notice_No==minNotice_No){
			String msg= "첫번째 글입니다";
			String url ="/admin/noticedetail.do?notice_No="+notice_No;
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
		
		int preNotice_No=noticeService.prePageNotice(notice_No);
		
		return "redirect:/admin/noticedetail.do?notice_No="+preNotice_No;
		
	}
	
	@RequestMapping("/nextPage.do")
	public String nextPage(@RequestParam(defaultValue="0") int notice_No,Model model){
		
		logger.info("다음페이지 이동처리 , 파라미터 값 notice_No={}",notice_No);
		int maxNotice_No = noticeService.nextPage();
		
		if(notice_No==maxNotice_No){
			String msg = "마지막 글입니다";
			String url = "/admin/noticedetail.do?notice_No="+notice_No;
			model.addAttribute("msg", msg);
			model.addAttribute("url",url);
				
			return "common/message";
		}
		
		int nextNotice_No = noticeService.nextPageNotice(notice_No);
		
		return "redirect:/admin/noticedetail.do?notice_No="+nextNotice_No;
	}
	
	
}
